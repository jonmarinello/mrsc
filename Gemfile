# IMPORTANT NOTE:
#
# All gems listed in this Gemfile MUST have their versions locked down all the way to the patch level!
#
source 'https://rubygems.org'

# Ruby version
ruby '2.3.1'

# Ruby on Rails
gem 'rails', '~> 5.0'

# Postgres database
gem 'pg'

# Authentication/Authorization
gem 'devise'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Haml
gem 'haml-rails'

# Use unicorn as the app server
gem 'unicorn'

# Bootstrap
gem 'bootstrap-sass'

# Bootswatch skins
gem 'bootswatch-rails'

# Active Admin
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'active_admin_theme'
gem 'activeadmin-sortable'

# New Relic Monitoring
gem 'newrelic_rpm'

# Simple forms
gem 'simple_form'

# Email validation
gem 'validates_email_format_of'
gem 'email_verifier'

# Phone number validation
gem 'phony_rails'

# Sortable Behavior
gem 'acts_as_list'

# Emails
gem 'roadie'
gem 'roadie-rails'

# Development dependencies
group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'annotate'
  # gem 'quiet_assets'
end

# Test dependencies
group :test do
  # Code Coverage
  gem 'simplecov'
  gem 'codeclimate-test-reporter', require: nil

  # assert_template or assigns tests
  gem 'rails-controller-testing'

  # awesome matchers that make mundane tests easy
  gem 'shoulda'
  gem 'minitest-spec-rails'

  # Capybara/Minitest
  gem "minitest-rails-capybara"
  gem 'capybara_minitest_spec'
  gem 'selenium-webdriver'

  # Colorized test output
  gem 'minitest-reporters'
end

# Pry lets you examine variables run through server as if you were in a rails console
group :test, :development do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-remote'
  gem 'pry-rescue'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Production dependencies
group :production do
  # Heroku requires this
  gem 'rails_12factor'
end
