class WelcomeController < ApplicationController
  def index
    @project = Project.first
    @parts_activity = @project.parts.order('updated_at DESC').limit(5)
  end
end
