require 'test_helper'

class PagesTest < Capybara::Rails::TestCase
  scenario 'hit all main pages', :js => true do
    # Visit the main index page
    visit root_path
    assert_on_page_path root_path

    # Flip through carousel images
    5.times do
      find('a[class="right carousel-control"]').click
      sleep 1
    end
    5.times do
      find('a[class="left carousel-control"]').click
      sleep 1
    end


    # Visit Index page
    validate_nav_page('index') do
      must_have_content 'Welcome To Mission Ridge Software Consulting'
    end


    # Visit Services page
    validate_nav_page('services') do
      click_all_services_more_less_links
      click_all_services_more_less_links
    end


    # Visit About page
    validate_nav_page('about') do
      must_have_content 'About Us'
      must_have_content 'The Team'

      # Close the first accordion panel
      click_link('Shawn Duex - Engineering Manager at RightScale, October 23, 2013')
      sleep 1

      # Test the recommendation accordion panels
      click_all_recommendation_links(true)
      click_all_recommendation_links(false)
    end


    # Visit portfolio page
    validate_nav_page('portfolio') do
      must_have_content 'We work well with others'
      must_have_content 'Fin & Field is all about the sportsman. Dedicated to those in search of their next outdoor adventure and to the outfitters, captains, and guides that make it all possible.'
      must_have_content 'RightScale provides a complete management platform to design, deploy, and manage the lifecycle of mission-critical cloud deployments.'
      must_have_content 'Elite Associates is involved in all aspects of the design, development and delivery of StarTeam to Fortune 1000 customers and uses that experience to help them get the most out of StarTeam.'
    end


    # Visit Start A Project page
    validate_nav_page('start_a_project') do
      must_have_content 'Start A Project '

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

      assert_on_page_path pages_start_a_project_path
      must_have_content "can't be blank"
      must_have_content 'An Error occurred.'

      within('#new_potential_project') do
        fill_in('potential_project[name]', :with => 'Roger Eaton')
        click_button('Submit')
      end

      assert_on_page_path pages_start_a_project_path
      must_have_content "can't be blank"
      must_have_content 'An Error occurred.'

      within('#new_potential_project') do
        fill_in('potential_project[email]', :with => 'xxx')
        click_button('Submit')
      end

      assert_on_page_path pages_start_a_project_path
      must_have_content 'invalid email address'
      must_have_content 'An Error occurred.'

      within('#new_potential_project') do
        fill_in('potential_project[email]', :with => 'roger.eaton@gmail.com')
        fill_in('potential_project[phone]', :with => '30912xxx')
        click_button('Submit')
      end

      assert_on_page_path pages_start_a_project_path
      must_have_content 'is an invalid number'
      must_have_content 'An Error occurred.'

      within('#new_potential_project') do
        fill_in('potential_project[name]', :with => 'Roger Eaton')
        fill_in('potential_project[email]', :with => 'roger.eaton@gmail.com')
        fill_in('potential_project[phone]', :with => '(805) 705-7929')
        fill_in('potential_project[project_idea]', :with => 'Build a cool new website for the Hans Dickman Boat Yard!')
        click_button('Submit')
      end

      # TODO: Get this to work - upgraded to latest selenium and this broke :(
      # assert_on_page_path pages_start_a_project_landing_page_path
    end


    # Test all the "READ MORE »" links
    read_more_button_text = 'READ MORE »'

    visit root_path
    assert_on_page_path root_path

    click_link_or_button(read_more_button_text)
    assert_on_page_path pages_services_path
    click_link_or_button(read_more_button_text)
    assert_on_page_path pages_about_path
    click_link_or_button(read_more_button_text)
    assert_on_page_path pages_portfolio_path
    click_link_or_button(read_more_button_text)
    assert_on_page_path pages_contact_path
    click_link_or_button(read_more_button_text)
    assert_on_page_path pages_start_a_project_path


    # Visit Contact page
    validate_nav_page('contact') do
      must_have_content 'Contact Us'

      # Visit all the social media links
      find('#skype-link').click
      find('#facebook-link').click
      find('#twitter-link').click
      find('#googleplus-link').click
      find('#linkedin-link').click
      find('#githib-link').click
    end
  end
end
