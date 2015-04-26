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
      post :create, orderpart: { beznal: @orderpart.beznal, convert: @orderpart.convert, faktdatetime: @orderpart.faktdatetime, nds: @orderpart.nds, partdescr: @orderpart.partdescr, partnumber: @orderpart.partnumber, predatetime: @orderpart.predatetime, pricesell: @orderpart.pricesell, priceship: @orderpart.priceship, qty: @orderpart.qty, shipper: @orderpart.shipper, statereserv_id: @orderpart.statereserv_id }
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
    patch :update, id: @orderpart, orderpart: { beznal: @orderpart.beznal, convert: @orderpart.convert, faktdatetime: @orderpart.faktdatetime, nds: @orderpart.nds, partdescr: @orderpart.partdescr, partnumber: @orderpart.partnumber, predatetime: @orderpart.predatetime, pricesell: @orderpart.pricesell, priceship: @orderpart.priceship, qty: @orderpart.qty, shipper: @orderpart.shipper, statereserv_id: @orderpart.statereserv_id }
    assert_redirected_to orderpart_path(assigns(:orderpart))
  end

  test "should destroy orderpart" do
    assert_difference('Orderpart.count', -1) do
      delete :destroy, id: @orderpart
    end

    assert_redirected_to orderparts_path
  end
end
