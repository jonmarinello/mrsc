require "test_helper"

class PagesTest < Capybara::Rails::TestCase
  scenario 'hit all main pages', :js => true do
    # Visit the main index page
    visit '/'
    assert_on_page_path "/"

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

    # Visit Projects page
    validate_nav_page('projects') do
      must_have_content 'We work well with others'
      must_have_content 'Fin & Field is all about the sportsman. Dedicated to those in search of their next outdoor adventure and to the outfitters, captains, and guides that make it all possible.'
      must_have_content 'RightScale provides a complete management platform to design, deploy, and manage the lifecycle of mission-critical cloud deployments.'
      must_have_content 'Elite Associates is involved in all aspects of the design, development and delivery of StarTeam to Fortune 1000 customers and uses that experience to help them get the most out of StarTeam.'
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

    # Visit Services page
    validate_nav_page('services') do
      click_all_services_more_less_links
      click_all_services_more_less_links
    end

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
