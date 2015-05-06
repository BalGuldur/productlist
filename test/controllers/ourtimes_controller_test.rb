require 'test_helper'

class OurtimesControllerTest < ActionController::TestCase
  setup do
    @ourtime = ourtimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ourtimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ourtime" do
    assert_difference('Ourtime.count') do
      post :create, ourtime: { answ: @ourtime.answ, name: @ourtime.name, rez: @ourtime.rez, ship: @ourtime.ship }
    end

    assert_redirected_to ourtime_path(assigns(:ourtime))
  end

  test "should show ourtime" do
    get :show, id: @ourtime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ourtime
    assert_response :success
  end

  test "should update ourtime" do
    patch :update, id: @ourtime, ourtime: { answ: @ourtime.answ, name: @ourtime.name, rez: @ourtime.rez, ship: @ourtime.ship }
    assert_redirected_to ourtime_path(assigns(:ourtime))
  end

  test "should destroy ourtime" do
    assert_difference('Ourtime.count', -1) do
      delete :destroy, id: @ourtime
    end

    assert_redirected_to ourtimes_path
  end
end
