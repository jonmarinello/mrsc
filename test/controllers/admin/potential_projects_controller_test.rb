require 'test_helper'

# Test all PotentialProject CRUD operations
class Admin::PotentialProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'should get redirected when hitting index because not logged in' do
    get :index
    assert_redirected_to new_admin_user_session_url
  end


  test 'should get index' do
    mini_test_login_admin_user!

    get :index
    assert_response :success
    assert_equal admin_potential_projects_path, request.path
  end


  test 'should create a potential_project' do
    mini_test_login_admin_user!

    assert_difference('PotentialProject.count') do
      post :create, :potential_project => { 'name' => 'Jon Marinello', 'email' => 'jonmarinello@gmail.com',
        'project_idea' => 'A really cool application idea!' }
    end
    assert_redirected_to admin_potential_project_path(assigns(:potential_project))
  end


  test 'should update a potential_project' do
    mini_test_login_admin_user!

    patch :update, :id => 1, :potential_project => { 'project_idea' => 'I got changed.' }
    assert_redirected_to admin_potential_project_path(assigns(:potential_project))
  end


  test 'should show a potential_project' do
    mini_test_login_admin_user!

    get :show, 'id' => '2'
    assert_response :success
    assert_equal admin_potential_project_path(assigns(:potential_project)), request.path
  end


  test 'should delete a potential_project' do
    mini_test_login_admin_user!

    assert_difference('PotentialProject.count', -1) do
      delete :destroy, 'id' => '1'
    end
    assert_redirected_to admin_potential_projects_path
  end
end
