class PrintJobsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_print_job_from_params, except: [:index, :ship]
  before_action :require_project_admin!, only: [:verify, :accept, :unassign]

  def printed
    @print_job.print!
    redirect_to project_path(@print_job.project_id)
  end

  def printundo
    @print_job.printed_undo!
    redirect_to project_path(@print_job.project_id)
  end

  def submit
    @print_job.photo = params[:photo]
    @print_job.measurements = [params['x-measure'], params['y-measure'], params['z-measure']].join(',')
    @print_job.submit!
    Notifier.print_awaiting_verification(@print_job).deliver_now
    redirect_to project_path(@print_job.project_id)
  end

  def ship
    shipped_jobs = PrintJob.for_user(current_user).where('id in (?)', params[:print_job_ids])
    shipped_jobs.update_all(shipping_info: params[:shipping_info])
    shipped_jobs.each { |p| p.ship! }
    redirect_to project_path(shipped_jobs.first.project_id)
  end

### Admin stuffffff

  # 2018-04-22 - No longer needed but allow admin to accept any parts stuck in
  # this legacy state.
  def verify
    @print_job.verify!
    Notifier.print_verified(@print_job).deliver_now
    redirect_to project_parts_path(@print_job.project_id)
  end

  def accept
    if(params[:force] == 'true')
      @print_job.aasm_state = :accepted
      @print_job.save!
    else
      @print_job.accept!
    end
    redirect_to project_parts_path(@print_job.project_id)
  end

  def unassign
    @print_job.reject!
    redirect_to project_parts_path(@print_job.project_id)
  end

protected
  def find_print_job_from_params
    @print_job = Project.find(params[:project_id]).print_jobs.find(params[:print_job_id])
  end
end
