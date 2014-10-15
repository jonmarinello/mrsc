require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test 'all routes' do
    assert_routing '/', :controller => 'pages', :action => 'index'
    assert_routing '/pages/portfolio', :controller => 'pages', :action => 'portfolio'
    assert_routing '/pages/about', :controller => 'pages', :action => 'about'
    assert_routing '/pages/services', :controller => 'pages', :action => 'services'
    assert_routing '/pages/contact', :controller => 'pages', :action => 'contact'
    assert_routing '/pages/start_a_project', :controller => 'pages', :action => 'start_a_project'
    assert_routing '/pages/start_a_project_landing_page', :controller => 'pages', :action => 'start_a_project_landing_page'
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
end
