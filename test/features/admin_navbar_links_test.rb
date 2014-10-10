require 'test_helper'

class AdminNavbarLinksTest < Capybara::Rails::TestCase
  scenario 'Navigating to all the pages listed in the Active Admin navbar', :js => true do
    # IMPORTANT NOTE: As new Active Admin dashboard sub-pages become available they will automatically be visited
    #                 by this test.

    # Login to active admin
    login_admin_user!

    # Save off the array of page titles (because we are navigating away form the page with the titles)
    active_admin_sub_page_titles = page.all('ul#tabs li').collect{|li| li.text}

    # Build black list of pages to omit
    active_admin_sub_page_black_list = []

    # Iterate through all the Active Admin dashboard sub pages.
    active_admin_sub_page_titles.each do |page_title|
      next if active_admin_sub_page_black_list.include?(page_title)

      # Navigate to the page
      click_link(page_title)

      # Validate we landed on the correct page
      assert_on_page_path "/admin/#{page_title.downcase.gsub(/\s/, '_')}"

      # Validate that the title matches
      page.must_have_content page_title
    end
  end
end
