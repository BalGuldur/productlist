require 'test_helper'

class OrderstatesControllerTest < ActionController::TestCase
  setup do
    @orderstate = orderstates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orderstates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orderstate" do
    assert_difference('Orderstate.count') do
      post :create, orderstate: { color: @orderstate.color, state: @orderstate.state }
    end

    assert_redirected_to orderstate_path(assigns(:orderstate))
  end

  test "should show orderstate" do
    get :show, id: @orderstate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orderstate
    assert_response :success
  end

  test "should update orderstate" do
    patch :update, id: @orderstate, orderstate: { color: @orderstate.color, state: @orderstate.state }
    assert_redirected_to orderstate_path(assigns(:orderstate))
  end

  test "should destroy orderstate" do
    assert_difference('Orderstate.count', -1) do
      delete :destroy, id: @orderstate
    end

    assert_redirected_to orderstates_path
  end
end
