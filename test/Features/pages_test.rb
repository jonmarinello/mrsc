require "test_helper"

class PagesTest < Capybara::Rails::TestCase

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
    click_link_or_button('LEARN MORE »')

    # Execute any code the client wants
    yield
  end


  scenario 'hit all main pages', :js => true do
    # Visit the main index page
    visit '/'
    assert_on_page_path "/"

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
    end

    # Visit Services page
    validate_nav_page('services') do
      must_have_content 'Our Core Services'
    end

    # Visit Contact page
    validate_nav_page('contact') do
      must_have_content 'Contact Us'
    end
  end
end
