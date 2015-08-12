require 'test_helper'

class ZakupkapartsControllerTest < ActionController::TestCase
  setup do
    @zakupkapart = zakupkaparts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zakupkaparts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zakupkapart" do
    assert_difference('Zakupkapart.count') do
      post :create, zakupkapart: { beznal: @zakupkapart.beznal, comment: @zakupkapart.comment, convertion: @zakupkapart.convertion, descr: @zakupkapart.descr, distributor_id: @zakupkapart.distributor_id, doner_id: @zakupkapart.doner_id, idorddistrib: @zakupkapart.idorddistrib, nds: @zakupkapart.nds, order_id: @zakupkapart.order_id, partnum: @zakupkapart.partnum, pmargin: @zakupkapart.pmargin, psaleprice: @zakupkapart.psaleprice, pshiptime_id: @zakupkapart.pshiptime_id, qty: @zakupkapart.qty, rezprice: @zakupkapart.rezprice, rezpricetype_id: @zakupkapart.rezpricetype_id, shipprice: @zakupkapart.shipprice, state_id: @zakupkapart.state_id }
    end

    assert_redirected_to zakupkapart_path(assigns(:zakupkapart))
  end

  test "should show zakupkapart" do
    get :show, id: @zakupkapart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zakupkapart
    assert_response :success
  end

  test "should update zakupkapart" do
    patch :update, id: @zakupkapart, zakupkapart: { beznal: @zakupkapart.beznal, comment: @zakupkapart.comment, convertion: @zakupkapart.convertion, descr: @zakupkapart.descr, distributor_id: @zakupkapart.distributor_id, doner_id: @zakupkapart.doner_id, idorddistrib: @zakupkapart.idorddistrib, nds: @zakupkapart.nds, order_id: @zakupkapart.order_id, partnum: @zakupkapart.partnum, pmargin: @zakupkapart.pmargin, psaleprice: @zakupkapart.psaleprice, pshiptime_id: @zakupkapart.pshiptime_id, qty: @zakupkapart.qty, rezprice: @zakupkapart.rezprice, rezpricetype_id: @zakupkapart.rezpricetype_id, shipprice: @zakupkapart.shipprice, state_id: @zakupkapart.state_id }
    assert_redirected_to zakupkapart_path(assigns(:zakupkapart))
  end

  test "should destroy zakupkapart" do
    assert_difference('Zakupkapart.count', -1) do
      delete :destroy, id: @zakupkapart
    end

    assert_redirected_to zakupkaparts_path
  end
end
