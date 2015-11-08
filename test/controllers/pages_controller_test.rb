require 'test_helper'

class PagesControllerTest < ActionController::TestCase
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
    assert_response :success
    assert_template :index
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end

  test 'should get portfolio' do
    get :portfolio
    assert_response :success
    assert_template :portfolio
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end

  test 'should get about' do
    get :about
    assert_response :success
    assert_template :about
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end

  test 'should get services' do
    get :services
    assert_response :success
    assert_template :services
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end

  test 'should get contact' do
    get :contact
    assert_response :success
    assert_template :contact
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end

  test 'should get start_a_project' do
    get :start_a_project
    assert_response :success
    assert_template :start_a_project
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end

  test 'should get start_a_project_langing_page' do
    get :start_a_project_landing_page
    assert_response :success
    # TODO: Find out why this doesn't work
    # assert_template :start_a_project_langing_page
    assert_template :layout => 'layouts/application'
    assert_select 'title', 'MRSC'
  end
end
