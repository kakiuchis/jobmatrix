require 'test_helper'

class LevelnamesControllerTest < ActionController::TestCase
  setup do
    @levelname = levelnames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:levelnames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create levelname" do
    assert_difference('Levelname.count') do
      post :create, levelname: { code: @levelname.code, name: @levelname.name }
    end

    assert_redirected_to levelname_path(assigns(:levelname))
  end

  test "should show levelname" do
    get :show, id: @levelname
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @levelname
    assert_response :success
  end

  test "should update levelname" do
    patch :update, id: @levelname, levelname: { code: @levelname.code, name: @levelname.name }
    assert_redirected_to levelname_path(assigns(:levelname))
  end

  test "should destroy levelname" do
    assert_difference('Levelname.count', -1) do
      delete :destroy, id: @levelname
    end

    assert_redirected_to levelnames_path
  end
end
