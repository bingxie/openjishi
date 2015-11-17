source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master' # For 4.x
# Use postgresql as the database for Active Record
gem 'pg'
gem 'delayed_job_active_record'

# Load environment variables from .env into ENV
gem 'dotenv-rails'

# A lightweight Sass tool set.
gem "bourbon"
# A lightweight semantic grid framework for Sass and Bourbon
gem "neat"
# Components and patterns built with Bourbon and Neat
gem 'refills'

gem "normalize-rails"
gem "autoprefixer-rails"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Rails jQuery file uploads via standard Rails "remote: true" forms
gem 'remotipart', '~> 1.2'

# ClientSideValidations for Ruby on Rails
gem 'client_side_validations', github: "DavyJonesLocker/client_side_validations", branch: "4-2-stable"

# Use Unicorn as the app server
gem 'unicorn'

# Slim templates generator
gem "slim-rails"

gem "font-awesome-rails"

#### Functional Gems

# Easily include static pages in your Rails app
gem 'high_voltage'

gem 'china_city'

#
gem 'devise', '~> 3.5', '>= 3.5.2'

# Select 2
# gem "select2-rails"
gem "select2-rails", ">= 4.0.0", github: 'nilbus/select2-rails', branch: 'full' # for new matcher usage

# JQ uploader
gem "jquery-fileupload-rails"

# For generate friendly url
gem 'stringex'
gem 'hashids'

# File upload
gem "paperclip", "~> 4.3"
gem 'paperclip-qiniu', :github => 'lidaobing/paperclip-qiniu'
# An easy extension for Paperclip to crop your image uploads using jCrop
gem 'papercrop', :github => 'rsantamaria/papercrop' # fix preview image size bug

# Decorators/View-Models for Rails Applications
gem 'draper', '~> 2.1.0'

# Middleware that displays speed badge for every html page
gem 'rack-mini-profiler'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # An IRB alternative and runtime developer console
  gem 'pry'
  # Causes rails console to open pry
  gem 'pry-rails'
  # Pry navigation commands via byebug
  gem 'pry-byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Better error page for Rack apps
  gem "better_errors"
  gem "binding_of_caller"

  # Supporting gem for Rails Panel
  gem 'meta_request'

  # Mutes assets pipeline log messages
  gem 'quiet_assets'

  # Colorized SQL Logging Backport for ActiveRecord
  gem 'activerecord-colored_log_subscriber'

  # Automatically reload your browser when 'view' files are modified
  gem "rack-livereload"
  gem 'guard-livereload', '~> 2.4', require: false

  # A very fast & simple Ruby web server
  gem "thin"

  # A web interface for browsing Ruby on Rails sent emails
  gem 'letter_opener_web', '~> 1.3.0'

  gem 'rubocop', require: false
end

group :test do
  # Create customizable MiniTest output formats
  gem "minitest-reporters"
end


