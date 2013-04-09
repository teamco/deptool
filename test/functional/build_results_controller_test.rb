require 'test_helper'

class BuildResultsControllerTest < ActionController::TestCase
  setup do
    @build_result = build_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:build_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create build_result" do
    assert_difference('BuildResult.count') do
      post :create, build_result: { name: @build_result.name }
    end

    assert_redirected_to build_result_path(assigns(:build_result))
  end

  test "should show build_result" do
    get :show, id: @build_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @build_result
    assert_response :success
  end

  test "should update build_result" do
    put :update, id: @build_result, build_result: { name: @build_result.name }
    assert_redirected_to build_result_path(assigns(:build_result))
  end

  test "should destroy build_result" do
    assert_difference('BuildResult.count', -1) do
      delete :destroy, id: @build_result
    end

    assert_redirected_to build_results_path
  end
end
