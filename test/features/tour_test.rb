require 'test_helper'

class PagesTest < Capybara::Rails::TestCase
  def run_tour(number_steps)
    # Wait for page to load
    sleep 1

    # Click the "take the tour" button
    find('#start-tour-tab').click

    # Run through the steps
    number_steps.times do
      click_button('Next »')
    end
  end


  scenario 'test index tour', :js => true do
    visit root_path
    assert_equal root_path, current_path
    run_tour(6)
  end


  scenario 'test services tour', :js => true do
    visit pages_services_path
    assert_equal pages_services_path, current_path
    run_tour(7)
  end


  scenario 'test about tour', :js => true do
    visit pages_about_path
    assert_equal pages_about_path, current_path
    run_tour(7)
  end


  scenario 'test portfolio tour', :js => true do
    visit pages_portfolio_path
    assert_equal pages_portfolio_path, current_path
    run_tour(7)
  end


  scenario 'test contact tour', :js => true do
    visit pages_contact_path
    assert_equal pages_contact_path, current_path
    run_tour(7)
  end


  scenario 'test start a project tour', :js => true do
    visit pages_start_a_project_path
    assert_equal pages_start_a_project_path, current_path
    run_tour(2)
  end
end
