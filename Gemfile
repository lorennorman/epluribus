source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.6'

# Use postgresql for Active Record
gem "pg", "~> 0.18"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 4.2.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2.2'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use puma as the app server
gem 'puma', '~> 5.6'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Markdown!
gem 'redcarpet', '~> 3.5'

# Authentication w/ Google OAuth2
gem 'devise'
gem 'omniauth-google-oauth2'
# added 2021-03 for https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
gem 'omniauth-rails_csrf_protection'

# Validating user alternate emails
gem 'validates_email_format_of'

# Tracking states of print jobs
gem 'aasm'

# Image upload handling
gem 'paperclip'
gem 'aws-sdk-s3'

# Heroku configs
ruby "2.7.5"
group :production do
  gem 'rails_12factor'
end

# React
gem 'react-rails', '~> 1.0'

# User ID hashing
gem 'hashids', '1.0.2'

gem "nanoid", "~> 2.0"

# Nokogiri CVE 2022-03-01
gem 'nokogiri', '~> 1.13.2'
