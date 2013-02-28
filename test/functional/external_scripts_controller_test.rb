require 'test_helper'

class ExternalScriptsControllerTest < ActionController::TestCase
  setup do
    @external_script = external_scripts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:external_scripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create external_script" do
    assert_difference('ExternalScript.count') do
      post :create, external_script: { script: @external_script.script }
    end

    assert_redirected_to external_script_path(assigns(:external_script))
  end

  test "should show external_script" do
    get :show, id: @external_script
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @external_script
    assert_response :success
  end

  test "should update external_script" do
    put :update, id: @external_script, external_script: { script: @external_script.script }
    assert_redirected_to external_script_path(assigns(:external_script))
  end

  test "should destroy external_script" do
    assert_difference('ExternalScript.count', -1) do
      delete :destroy, id: @external_script
    end

    assert_redirected_to external_scripts_path
  end
end
