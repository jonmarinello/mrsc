require "test_helper"

class PagesTest < Capybara::Rails::TestCase
  scenario 'hit all main pages', :js => true do
    # Visit the main index page
    visit '/'

    # Validate we landed on the correct page
    assert_on_page_path '/'

    # Validate content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'Welcome To Mission Ridge Software Consulting'
    must_have_content 'Have a project we can help with?'
    must_have_content 'Stay Connected With Us'
  end
end
