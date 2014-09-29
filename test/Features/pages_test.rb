require "test_helper"

class PagesTest < Capybara::Rails::TestCase
  scenario 'hit all main pages', :js => true do
    # Visit the main index page
    visit '/'

    # Validate we landed on the correct page
    assert_on_page_path '/'

    # Validate expected content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'Welcome To Mission Ridge Software Consulting'
    must_have_content 'Have a project we can help with?'
    must_have_content 'Stay Connected With Us'

    click_link_or_button('LEARN MORE »')


    # Visit Projects tab
    click_link('Projects', match: :first)

    # Validate we landed on the correct page
    assert_on_page_path '/pages/projects'

    # Validate expected content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'We work well with others'
    must_have_content 'Fin & Field is all about the sportsman. Dedicated to those in search of their next outdoor adventure and to the outfitters, captains, and guides that make it all possible.'
    must_have_content 'RightScale provides a complete management platform to design, deploy, and manage the lifecycle of mission-critical cloud deployments.'
    must_have_content 'Elite Associates is involved in all aspects of the design, development and delivery of StarTeam to Fortune 1000 customers and uses that experience to help them get the most out of StarTeam.'
    must_have_content 'Have a project we can help with?'
    must_have_content 'Stay Connected With Us'

    click_link_or_button('LEARN MORE »')


    # Visit About tab
    click_link('About', match: :first)

    # Validate we landed on the correct page
    assert_on_page_path '/pages/about'

    # Validate expected content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'The Team'
    must_have_content 'Have a project we can help with?'
    must_have_content 'Stay Connected With Us'

    click_link_or_button('LEARN MORE »')


    # Visit Services tab
    click_link('Services', match: :first)

    # Validate we landed on the correct page
    assert_on_page_path '/pages/services'

    # Validate expected content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'Our Core Services'
    must_have_content 'Have a project we can help with?'
    must_have_content 'Stay Connected With Us'

    click_link_or_button('LEARN MORE »')


    # Visit Services tab
    click_link('Contact', match: :first)

    # Validate we landed on the correct page
    assert_on_page_path '/pages/contact'

    # Validate expected content
    must_have_content 'Mission Ridge Software Consulting LLC'
    must_have_content 'Contact Us'
    must_have_content 'Have a project we can help with?'
    must_have_content 'Stay Connected With Us'

    click_link_or_button('LEARN MORE »')
  end
end
