require "test_helper"

class PagesTest < Capybara::Rails::TestCase
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
