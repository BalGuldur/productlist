require 'test_helper'

class OrderpartsControllerTest < ActionController::TestCase
  setup do
    @orderpart = orderparts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orderparts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orderpart" do
    assert_difference('Orderpart.count') do
      post :create, orderpart: { beznal: @orderpart.beznal, comment: @orderpart.comment, convertion: @orderpart.convertion, descr: @orderpart.descr, distrib: @orderpart.distrib, doner_id: @orderpart.doner_id, nds: @orderpart.nds, order_id: @orderpart.order_id, panswtime_id: @orderpart.panswtime_id, partnum: @orderpart.partnum, pmargin: @orderpart.pmargin, psaleprice: @orderpart.psaleprice, pshiptime_id: @orderpart.pshiptime_id, qty: @orderpart.qty, rezprice: @orderpart.rezprice, rezpricetype_id: @orderpart.rezpricetype_id, reztime_id: @orderpart.reztime_id, shipprice: @orderpart.shipprice, state_id: @orderpart.state_id }
    end

    assert_redirected_to orderpart_path(assigns(:orderpart))
  end

  test "should show orderpart" do
    get :show, id: @orderpart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orderpart
    assert_response :success
  end

  test "should update orderpart" do
    patch :update, id: @orderpart, orderpart: { beznal: @orderpart.beznal, comment: @orderpart.comment, convertion: @orderpart.convertion, descr: @orderpart.descr, distrib: @orderpart.distrib, doner_id: @orderpart.doner_id, nds: @orderpart.nds, order_id: @orderpart.order_id, panswtime_id: @orderpart.panswtime_id, partnum: @orderpart.partnum, pmargin: @orderpart.pmargin, psaleprice: @orderpart.psaleprice, pshiptime_id: @orderpart.pshiptime_id, qty: @orderpart.qty, rezprice: @orderpart.rezprice, rezpricetype_id: @orderpart.rezpricetype_id, reztime_id: @orderpart.reztime_id, shipprice: @orderpart.shipprice, state_id: @orderpart.state_id }
    assert_redirected_to orderpart_path(assigns(:orderpart))
  end

  test "should destroy orderpart" do
    assert_difference('Orderpart.count', -1) do
      delete :destroy, id: @orderpart
    end

    assert_redirected_to orderparts_path
  end
end
