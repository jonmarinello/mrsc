require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def common_tests(page_template)
    assert_response :success
    assert_template page_template
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end

  test 'all routes' do
    assert_routing root_path, :controller => 'pages', :action => 'index'
    assert_routing pages_portfolio_path, :controller => 'pages', :action => 'portfolio'
    assert_routing pages_about_path, :controller => 'pages', :action => 'about'
    assert_routing pages_services_path, :controller => 'pages', :action => 'services'
    assert_routing pages_contact_path, :controller => 'pages', :action => 'contact'
    assert_routing pages_start_a_project_path, :controller => 'pages', :action => 'start_a_project'
    assert_routing pages_start_a_project_landing_page_path, :controller => 'pages', :action => 'start_a_project_landing_page'
  end


  test 'should get index' do
    get :index
    common_tests 'pages/index'
    assert_not_nil assigns :active_tab
  end


  test 'should get portfolio' do
    get :portfolio
    common_tests 'pages/portfolio'
    assert_not_nil assigns :active_tab
  end


  test 'should get about' do
    get :about
    common_tests 'pages/about'
    assert_not_nil assigns :active_tab
  end


  test 'should get services' do
    get :services
    common_tests 'pages/services'
    assert_not_nil assigns :active_tab
  end


  test 'should get contact' do
    get :contact
    common_tests 'pages/contact'
    assert_not_nil assigns :active_tab
  end


  test 'should get start_a_project' do
    get :start_a_project
    common_tests 'pages/start_a_project'
    assert_not_nil assigns :active_tab
  end


  test 'should create a potential project' do
    assert_difference('PotentialProject.count') do
      post :create, potential_project: {name: 'Bryan Flynn', email: 'bryan@gmail.com', project_idea: 'To build the perfect androird woman!'}
    end

    assert_nil assigns :active_tab
    assert_not_nil assigns :potential_project
    assert_redirected_to pages_start_a_project_landing_page_path
  end


  test 'should get start_a_project_langing_page' do
    get :start_a_project_landing_page
    common_tests 'pages/start_a_project_landing_page'
    assert_nil assigns :active_tab
  end
end
