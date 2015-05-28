require 'test_helper'

class ReestrotgruzoksControllerTest < ActionController::TestCase
  setup do
    @reestrotgruzok = reestrotgruzoks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reestrotgruzoks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reestrotgruzok" do
    assert_difference('Reestrotgruzok.count') do
      post :create, reestrotgruzok: { kontragent: @reestrotgruzok.kontragent, numbill: @reestrotgruzok.numbill, numotgruzdoc: @reestrotgruzok.numotgruzdoc, resievedate: @reestrotgruzok.resievedate, sendtobuh: @reestrotgruzok.sendtobuh, sendtoclient: @reestrotgruzok.sendtoclient }
    end

    assert_redirected_to reestrotgruzok_path(assigns(:reestrotgruzok))
  end

  test "should show reestrotgruzok" do
    get :show, id: @reestrotgruzok
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reestrotgruzok
    assert_response :success
  end

  test "should update reestrotgruzok" do
    patch :update, id: @reestrotgruzok, reestrotgruzok: { kontragent: @reestrotgruzok.kontragent, numbill: @reestrotgruzok.numbill, numotgruzdoc: @reestrotgruzok.numotgruzdoc, resievedate: @reestrotgruzok.resievedate, sendtobuh: @reestrotgruzok.sendtobuh, sendtoclient: @reestrotgruzok.sendtoclient }
    assert_redirected_to reestrotgruzok_path(assigns(:reestrotgruzok))
  end

  test "should destroy reestrotgruzok" do
    assert_difference('Reestrotgruzok.count', -1) do
      delete :destroy, id: @reestrotgruzok
    end

    assert_redirected_to reestrotgruzoks_path
  end
end
