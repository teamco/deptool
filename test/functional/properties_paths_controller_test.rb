require 'test_helper'

class PropertiesPathsControllerTest < ActionController::TestCase
  setup do
    @properties_path = properties_paths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties_paths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create properties_path" do
    assert_difference('PropertiesPath.count') do
      post :create, properties_path: { name: @properties_path.name }
    end

    assert_redirected_to properties_path_path(assigns(:properties_path))
  end

  test "should show properties_path" do
    get :show, id: @properties_path
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @properties_path
    assert_response :success
  end

  test "should update properties_path" do
    put :update, id: @properties_path, properties_path: { name: @properties_path.name }
    assert_redirected_to properties_path_path(assigns(:properties_path))
  end

  test "should destroy properties_path" do
    assert_difference('PropertiesPath.count', -1) do
      delete :destroy, id: @properties_path
    end

    assert_redirected_to properties_paths_path
  end
end
