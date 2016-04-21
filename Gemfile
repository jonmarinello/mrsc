# IMPORTANT NOTE:
#
# All gems listed in this Gemfile MUST have their versions locked down all the way to the patch level!
#
source 'https://rubygems.org'

# Ruby version
ruby '2.2.3'

# Ruby on Rails
gem 'rails', '4.2.5'

# Postgres database
gem 'pg', '0.18.4'

# Authentication/Authorization
gem 'devise', '3.5.2'

# Use SCSS for stylesheets
gem 'sass-rails', '5.0.4'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.7.2'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.1'

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.1.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'

# Haml
gem 'haml-rails', '0.9.0'

# Use unicorn as the app server
gem 'unicorn', '4.8.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.0.7'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.0', group: :doc

# Bootstrap
gem 'bootstrap-sass', '3.3.5.1'

# Bootswatch skins
gem 'bootswatch-rails', '3.3.5'

# Active Admin
gem 'activeadmin', '~> 1.0.0.pre2'
gem 'active_admin_theme', '1.0.3'
gem 'activeadmin-sortable', '0.0.3'

# New Relic Monitoring
gem 'newrelic_rpm', '3.14.0.305'

# Simple forms
gem 'simple_form', '3.2.0'

# Email validation
gem 'validates_email_format_of', '1.6.1'
gem 'email_verifier', '0.1.0'

# Phone number validation
gem 'phony_rails', '0.12.11'

# Sortable Behavior
gem 'acts_as_list', '0.7.2'

# Emails
gem 'roadie', '3.0.5'
gem 'roadie-rails', '1.0.6'

# Development dependencies
group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.4'
  gem 'annotate', '~> 2.6'
end

# Test dependencies
group :test do
  # Code Coverage
  gem 'simplecov', '~> 0.10'
  gem 'codeclimate-test-reporter', '~> 0.4', require: nil

  # awesome matchers that make mundane tests easy
  gem 'shoulda', '~> 3.5'
  gem 'minitest-spec-rails', '~> 5.3'

  # Capybara/Minitest
  gem "minitest-rails-capybara", '~> 2.1'
  gem 'capybara_minitest_spec', '~> 1.0'
  gem 'selenium-webdriver', '~> 2.48'

  # Colorized test output
  gem 'minitest-reporters', '~> 1.1', '>= 1.1.7'
end

# Pry lets you examine variables run through server as if you were in a rails console
group :test, :development do
  gem 'pry-rails', '~> 0.3'
  gem 'pry-byebug', '~> 3.3'
  gem 'pry-remote', '~> 0.1'
  gem 'pry-rescue', '~> 1.4'
  gem 'awesome_print', '~> 1.6'
  gem 'better_errors', '~> 2.1'
  gem 'binding_of_caller', '~> 0.7'
  gem 'quiet_assets', '~> 1.1'
end

# Production dependencies
group :production do
  # Heroku requires this
  gem 'rails_12factor', '0.0.3'
end
