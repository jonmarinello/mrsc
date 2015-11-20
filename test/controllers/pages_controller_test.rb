require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def common_get_test(page, page_template)
    get page
    assert_response :success
    assert_template page_template
    assert_template layout: 'layouts/application'
    assert_select 'title', 'MRSC'
  end


  test 'all routes' do
    assert_routing root_path, controller: 'pages', action: 'index'
    assert_routing pages_portfolio_path, controller: 'pages', action: 'portfolio'
    assert_routing pages_about_path, controller: 'pages', action: 'about'
    assert_routing pages_services_path, controller: 'pages', action: 'services'
    assert_routing pages_contact_path, controller: 'pages', action: 'contact'
    assert_routing pages_start_a_project_path, controller: 'pages', action: 'start_a_project'
    assert_routing pages_start_a_project_landing_page_path, controller: 'pages', action: 'start_a_project_landing_page'
  end


  test 'should get index' do
    common_get_test :index, 'pages/index'
    assert_not_nil assigns(:active_tab)
    assert_not_nil assigns(:company_name)
    assert_select '#start-tour-tab', 1
  end


  test 'should get portfolio' do
    common_get_test :portfolio, 'pages/portfolio'
    assert_not_nil assigns(:active_tab)
    assert_select '#start-tour-tab', 1
  end


  test 'should get about' do
    common_get_test :about, 'pages/about'
    assert_not_nil assigns(:active_tab)
    assert_not_nil assigns(:person_image_width)
    assert_not_nil assigns(:recommendations)
    assert_select '#start-tour-tab', 1
  end


  test 'should get services' do
    common_get_test :services, 'pages/services'
    assert_not_nil assigns(:active_tab)
    assert_select '#start-tour-tab', 1
  end


  test 'should get contact' do
    common_get_test :contact, 'pages/contact'
    assert_not_nil assigns(:active_tab)
    assert_select '#start-tour-tab', 1
  end


  test 'should get start_a_project' do
    common_get_test :start_a_project, 'pages/start_a_project'
    assert_not_nil assigns(:active_tab)
    assert_select '#start-tour-tab', 1
  end


  test 'should create a potential project' do
    assert_difference('PotentialProject.count') do
      post :create, potential_project: {name: 'Bryan Flynn', email: 'bryan@gmail.com', project_idea: 'To build the perfect androird woman!'}
    end

    assert_nil assigns(:active_tab)
    assert_not_nil assigns(:potential_project)
    assert_redirected_to pages_start_a_project_landing_page_path
  end


  test 'should fail to create a potential project' do
    assert_difference('PotentialProject.count', 0) do
      post :create, potential_project: {name: 'Bryan Flynn', email: 'bryan@gmail.com'}
    end

    assert_nil assigns(:active_tab)
    assert_not_nil assigns(:potential_project)
    assert_equal 'An Error occurred.', flash[:alert]
    assert_equal pages_start_a_project_path, request.path
  end


  test 'should get start_a_project_langing_page' do
    common_get_test :start_a_project_landing_page, 'pages/start_a_project_landing_page'
    assert_nil assigns(:active_tab)
    assert_select '#start-tour-tab', 0
  end
end
