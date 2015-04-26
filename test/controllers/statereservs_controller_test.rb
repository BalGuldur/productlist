require 'test_helper'

class StatereservsControllerTest < ActionController::TestCase
  setup do
    @statereserv = statereservs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statereservs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statereserv" do
    assert_difference('Statereserv.count') do
      post :create, statereserv: { color: @statereserv.color, status: @statereserv.status }
    end

    assert_redirected_to statereserv_path(assigns(:statereserv))
  end

  test "should show statereserv" do
    get :show, id: @statereserv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statereserv
    assert_response :success
  end

  test "should update statereserv" do
    patch :update, id: @statereserv, statereserv: { color: @statereserv.color, status: @statereserv.status }
    assert_redirected_to statereserv_path(assigns(:statereserv))
  end

  test "should destroy statereserv" do
    assert_difference('Statereserv.count', -1) do
      delete :destroy, id: @statereserv
    end

    assert_redirected_to statereservs_path
  end
end
