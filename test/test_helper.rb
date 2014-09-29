ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
require "minitest/rails/capybara"


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
  def silence_stream(stream, &block)
    yield
  end
end


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
  add_group 'Concerns', 'app/models/concerns'
  coverage_dir 'public/coverage'
end

# Start the SimpleCov profiler
SimpleCov.start 'mrsc_profile'



class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  Capybara.default_wait_time = 5


  def switch_to_new_window!(sleep_seconds_before = 1, sleep_seconds_after = 1)
    # Sleep before trying to change windows to the new browser instance. This is needed because it takes a little time
    # for the new browser window to launch and get loaded
    sleep sleep_seconds_before
    page.driver.browser.switch_to.window page.driver.browser.window_handles.last
    # We also need a sleep after changing windows and before the next commend is to let things settle down
    sleep sleep_seconds_after
  end


  # Waits for the page element to become available using Capybara's find() method
  def wait_for_page_element(element)
    find(element)
  end


  # Assert we landed on the correct page and if not, provide a helpful error message
  def assert_on_page_path(expected_page, actual_page = current_path)
    assert_equal expected_page, actual_page, 'ERROR: Landed on wrong page'
  end


  # Hack to allow us to input data into a field using a jQuery input mask see:
  #    https://github.com/thoughtbot/capybara-webkit/issues/303 for details.
  def fill_in_input_mask(location, options={})
    len = options[:with].to_s.length - 1
    len.times do
      fill_in location, :with => '1'
    end
    fill_in location, options
  end


  DEFAULT_SLEEP_TIME = 0.12

  # Helper for testing any main navigation bar page
  def validate_nav_page(page_name, &block)
    if page_name != 'index'
      # Visit main page via navigation bar button
      silence_stream(STDOUT) do
        click_link(page_name.titleize, match: :first)
      end
    else
      visit '/pages/index'
    end

    # Validate we landed on the correct page
    assert_on_page_path "/pages/#{page_name}"

    # Validate standard expected content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'Have a project we can help with?'
    must_have_content 'Stay Connected With Us'

    # click on the learn more button
    silence_stream(STDOUT) do
      click_link_or_button('LEARN MORE »')
    end

    # Execute any code the client wants
    yield
  end


  # Help for clicking all the services "More.../Less..." links
  def click_all_services_more_less_links(sleep_seconds = DEFAULT_SLEEP_TIME)
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

    click_link('Nitin Mohan - Senior Software Engineer at RightScale, April 6, 2013')
    must_have_content 'Its been a delight to work along-side Jon' if validate_content

    click_link('Cary Penniman - Software Architect at RightScale, April 5, 2013')
    must_have_content 'Jon has rock solid software engineering skills' if validate_content

    click_link('Dan Onorato - Quality Assurance Manager, RightScale April 24, 2012')
    must_have_content 'RightScale contracted with Jon Marinello' if validate_content

    click_link('Efrain Olivares - Software Develompent Engineer in Test, RightScale April 16, 2012')
    must_have_content 'I\'ve had the pleasure of working with Jon' if validate_content

    click_link('Vitaly Sedelnik – Cloud Solutions Engineer / Team Lead, RightScale August 16, 2014')
    must_have_content 'Jon is super skilled software engineer' if validate_content

    click_link('Steve Reynolds – Managing Partner, Elite Associates 2011')
    must_have_content 'We contracted with Mission Ridge Software Consulting LLC' if validate_content
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

