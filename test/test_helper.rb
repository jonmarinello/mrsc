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

  Capybara.default_wait_time = 5


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
      fill_in('admin_user[email]', :with => admin_user.email)
      fill_in('admin_user[password]', :with => 'password')
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


  # Assert we landed on the correct page and if not, provide a helpful error message
  def assert_on_page_path(expected_page, actual_page = current_path)
    assert_equal expected_page.chomp('/'), actual_page.chomp('/'), 'ERROR: Landed on wrong page'
  end


  # Hack to allow us to input data into a field using a jQuery input mask see:
  #    https://github.com/thoughtbot/capybara-webkit/issues/303 for details.
  def fill_in_input_mask(location, options = {})
    len = options[:with].to_s.length - 1
    len.times do
      fill_in location, :with => '1'
    end
    fill_in location, options
  end


  # Helper for testing any main navigation bar page
  def validate_nav_page(page_name, &_block)
    # Visit the desired page
    visit "/pages/#{page_name}"

    # Validate we landed on the correct page
    assert_on_page_path "/pages/#{page_name}"

    # Validate standard expected content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'Have a project we can help with?' if page_name != 'start_a_project'
    must_have_content 'Stay Connected'

    # click on the learn more button
    click_link_or_button('LEARN MORE »') if page_name != 'start_a_project'

    # Execute any code the client wants
    yield
  end


  DEFAULT_SLEEP_TIME_IN_SECONDS = 0.25

  # Help for clicking all the services "More.../Less..." links
  def click_all_services_more_less_links(sleep_seconds = DEFAULT_SLEEP_TIME_IN_SECONDS)
    # Make surte we are on the services page
    assert_on_page_path pages_services_path

    # Click each of the services more/less links and sleep a little in between in case you are watching (looks better)
    find('#toggle-rails-text').click
    sleep sleep_seconds
    find('#toggle-iphone-text').click
    sleep sleep_seconds
    find('#toggle-scrum-text').click
    sleep sleep_seconds
    find('#toggle-mind-map-text').click
    sleep sleep_seconds
    find('#toggle-prototyping-text').click
    sleep sleep_seconds
    find('#toggle-cloud-text').click
    sleep sleep_seconds
  end


  # Helper for testing recommendation accordion panels
  def click_all_recommendation_links(validate_content)
    click_link('Shawn Duex - Engineering Manager at RightScale, October 23, 2013')
    must_have_content 'Jon and I have been working together on and off since 2008' if validate_content

    click_link('Kannan Manickam - Senior Software Engineer at RightScale, April 8, 2013')
    must_have_content 'Jon is an one-man-army' if validate_content
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
    Timeout.timeout(Capybara.default_wait_time) do
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


# Mandrill mock to avoid sending email messages (and blowing through our quota and making it harder to run
# manual tests and find the results) in our automated tests.
#

# Set to true to see mock log messages
$log_mandrill_mock_messages = false

module MandrillMailer
  class TemplateMailer < MandrillMailer::CoreMailer
    def deliver
      puts "\nMandrill API TemplateMailer#deliver called...\n" if $log_mandrill_mock_messages
    end
  end
end
