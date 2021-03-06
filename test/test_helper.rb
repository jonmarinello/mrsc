# Code Climate setup
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

# This needs to be at the very top - before any application code is run
# Test coverage
require 'simplecov'

#
# SimpleCov Initialization
#

# Remove any previous SimpleCov results
FileUtils.rm_rf('public/coverage')

# Define profiles
SimpleCov.profiles.define 'mrsc_profile' do
  load_profile 'rails'

  add_filter 'vendor'
  add_filter 'test'
  add_filter 'app/admin'
  add_filter 'bin'
  add_filter 'Rakefile'
  add_filter 'lib/tasks'

  add_group 'Models', 'app/models'

  coverage_dir 'public/coverage'
end

SimpleCov.start 'mrsc_profile'
SimpleCov.command_name

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'

reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


#
# Code under test sometimes logs information to STDOUT and it can be suppressed. To suppress STDOUT in your tests,
# wrap your code under test like this:
#
# silence_stream(STDOUT) do
#   <your test code goes here>
# end
#
# If you need to debug a failure and want to see the logged output just run 'export SHOW_STDOUT=1' on the command line
# and rerun the test.
#
if ENV['SHOW_STDOUT'] && ENV['SHOW_STDOUT'] == '1'
  def silence_stream(_stream, &_block)
    yield
  end
end



class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  Capybara.default_max_wait_time = 5


  # Temporary helper until we get a better one in the test helpers
  def mini_test_login_admin_user!(admin_user = admin_users(:one))
    @request.env['devise.mapping'] = Devise.mappings[:admin_user] if @request.present?
    # sign the user in
    sign_in admin_user if @request.present?
  end


  # logs in as admin user for Active Admin tests
  def login_admin_user!(admin_user = admin_users(:one))
    visit new_admin_user_session_path
    within('#session_new') do
      fill_in('admin_user[email]', with: admin_user.email)
      fill_in('admin_user[password]', with: 'password')
      click_button('Login')
    end
  end


  def switch_to_new_window!(sleep_seconds_before = 1, sleep_seconds_after = 1)
    # Sleep before trying to change windows to the new browser instance. This is needed because it takes a little time
    # for the new browser window to launch and get loaded
    sleep sleep_seconds_before
    page.driver.browser.switch_to.window page.driver.browser.window_handles.last
    # We also need a sleep after changing windows and before the next commend is to let things settle down
    sleep sleep_seconds_after
  end


  # Hack to allow us to input data into a field using a jQuery input mask see:
  #    https://github.com/thoughtbot/capybara-webkit/issues/303 for details.
  def fill_in_input_mask(location, options = {})
    len = options[:with].to_s.length - 1
    len.times do
      fill_in location, with: '1'
    end
    fill_in location, options
  end


  # Helper for testing any main navigation bar page
  def validate_nav_page(page_name, &_block)
    # Visit the desired page
    visit "/pages/#{page_name}"

    # Validate we landed on the correct page
    assert_equal "/pages/#{page_name}", current_path

    # Execute any code the client wants
    yield
  end
end


#
# Ajax related logic
#

# Borrowed from http://robots.thoughtbot.com/automatically-wait-for-ajax-with-capybara
#
# Example usage:
#   visit users_path
#   click_link 'Add Gabe as friend via AJAX'
#   wait_for_ajax # This is new!
#   reload_page
#   expect(page).to have_css('.favorite', text: 'Gabe')
#
module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end


def reload_page
  # Capybara/Selenium compatible page reload
  visit page.driver.browser.current_url
end

# Waits for the page element to become available using Capybara's find() method.
#
# You can pass an optional try_count which defaults to 5 and waits one second
# between each try. If the element can't be found after try_count times, the
# Capybara::ElementNotFound exception will be raised.
def wait_for_page_element(element, try_count = 5)
  try_count.times do |i|
    begin
      return find(element)
    rescue Capybara::ElementNotFound
      if i + 1 < try_count
        sleep 1
      else
        raise
      end
    end
  end
end
