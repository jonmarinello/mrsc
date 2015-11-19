require 'test_helper'

class PagesTest < Capybara::Rails::TestCase
  # Helper for clicking all the services "More.../Less..." links
  DEFAULT_SLEEP_TIME_IN_SECONDS = 0.25
  def click_all_services_more_less_links(sleep_seconds = DEFAULT_SLEEP_TIME_IN_SECONDS)
    # Make sure we are on the services page
    assert_equal pages_services_path, current_path

    # Click each of the services more/less links and sleep a little in between in case you're watching (looks better)
    find('a#toggle-rails-text').click
    find('a#toggle-rails-text').click
    find('a#toggle-cms-text').click
    find('a#toggle-cms-text').click
    find('a#toggle-ios-text').click
    find('a#toggle-ios-text').click
    find('a#toggle-cloud-text').click
    find('a#toggle-cloud-text').click
    find('a#toggle-scrum-text').click
    find('a#toggle-scrum-text').click
    find('a#toggle-prototyping-text').click
    find('a#toggle-prototyping-text').click
  end


  scenario 'hit all read more buttons', :js => true do
    # Sleeps needed so current_path catches up - LAME
    visit root_path
    sleep 1
    find('#read-more').click
    sleep 1
    assert_equal pages_services_path, current_path
    find('#read-more').click
    sleep 1
    assert_equal pages_about_path, current_path
    find('#read-more').click
    sleep 1
    assert_equal pages_portfolio_path, current_path
    find('#read-more').click
    sleep 1
    assert_equal pages_contact_path, current_path
    find('#read-more').click
    sleep 1
    assert_equal pages_start_a_project_path, current_path
  end


  scenario 'test carousel', :js => true do
    # Visit the main index page
    visit root_path
    assert_equal root_path, current_path

    # Flip through carousel images
    5.times do
      find('a[class="right carousel-control"]').click
      sleep 1
    end
    5.times do
      find('a[class="left carousel-control"]').click
      sleep 1
    end
  end

  scenario 'visit all main pages', :js => true do
    # Visit Index page
    validate_nav_page('index') do
    end


    # Visit Services page
    validate_nav_page('services') do
      click_all_services_more_less_links
    end


    # Visit About page
    validate_nav_page('about') do
      # Close the first accordion panel
      click_link('Shawn Duex - Engineering Manager at RightScale, October 23, 2013')
      sleep 1

      # Test the recommendation accordion panels
      click_link('Shawn Duex - Engineering Manager at RightScale, October 23, 2013')
      click_link('Kannan Manickam - Senior Software Engineer at RightScale, April 8, 2013')
    end


    # Visit portfolio page
    validate_nav_page('portfolio') do
    end


    # Visit Contact page
    validate_nav_page('contact') do
      # Visit all the social media links
      find('#skype-link').click
      find('#facebook-link').click
      find('#twitter-link').click
      find('#googleplus-link').click
      find('#linkedin-link').click
      find('#githib-link').click
    end


    # Visit Start A Project page
    validate_nav_page('start_a_project') do
      within('#new_potential_project') do
        fill_in('potential_project[company_name]', :with => 'Hans Dickman Boat Yard')
        check('potential_project[type_website]')
        check('potential_project[type_ruby_on_rails]')
        check('potential_project[type_web_design]')
        uncheck('potential_project[type_code_review]')
        check('potential_project[type_other]')
        fill_in('potential_project[start_timeframe]', :with => 'Fall 2015')
        fill_in('potential_project[additional_info]', :with => 'Call me back ASAP to discuss this opportunity.')
        fill_in('potential_project[heard_about_us]', :with => 'Google search.')
        check('potential_project[keep_me_updated]')
        click_button('Submit')
      end

      assert_equal pages_start_a_project_path, current_path

      within('#new_potential_project') do
        fill_in('potential_project[name]', :with => 'Roger Eaton')
        click_button('Submit')
      end

      assert_equal pages_start_a_project_path, current_path

      within('#new_potential_project') do
        fill_in('potential_project[email]', :with => 'xxx')
        click_button('Submit')
      end

      assert_equal pages_start_a_project_path, current_path

      within('#new_potential_project') do
        fill_in('potential_project[email]', :with => 'roger.eaton@gmail.com')
        fill_in('potential_project[phone]', :with => '30912xxx')
        click_button('Submit')
      end

      assert_equal pages_start_a_project_path, current_path

      within('#new_potential_project') do
        fill_in('potential_project[name]', :with => 'Roger Eaton')
        fill_in('potential_project[email]', :with => 'roger.eaton@gmail.com')
        fill_in('potential_project[phone]', :with => '(805) 705-7929')
        fill_in('potential_project[project_idea]', :with => 'Build a cool new website for the Hans Dickman Boat Yard!')
        click_button('Submit')
      end

      assert_equal pages_start_a_project_landing_page_path, current_path
    end
  end
end
