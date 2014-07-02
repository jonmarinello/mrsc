require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get projects' do
    get :projects
    assert_response :success
  end

  test 'should get about' do
    get :about
    assert_response :success
  end

  test 'should get services' do
    get :services
    assert_response :success
  end

  test 'should get contact' do
    get :contact
    assert_response :success
  end

end
