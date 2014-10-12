require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test 'all routes' do
    assert_routing '/', :controller => 'pages', :action => 'index'
    assert_routing '/pages/portfolio', :controller => 'pages', :action => 'portfolio'
    assert_routing '/pages/about', :controller => 'pages', :action => 'about'
    assert_routing '/pages/services', :controller => 'pages', :action => 'services'
    assert_routing '/pages/contact', :controller => 'pages', :action => 'contact'
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
end
