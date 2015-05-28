require 'test_helper'

class ReestrprihodovsControllerTest < ActionController::TestCase
  setup do
    @reestrprihodov = reestrprihodovs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reestrprihodovs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reestrprihodov" do
    assert_difference('Reestrprihodov.count') do
      post :create, reestrprihodov: { givetobuh: @reestrprihodov.givetobuh, givetoruk: @reestrprihodov.givetoruk, kontragent: @reestrprihodov.kontragent, numbill: @reestrprihodov.numbill, numprihoddoc: @reestrprihodov.numprihoddoc, prihoddate: @reestrprihodov.prihoddate, sendwithpech: @reestrprihodov.sendwithpech }
    end

    assert_redirected_to reestrprihodov_path(assigns(:reestrprihodov))
  end

  test "should show reestrprihodov" do
    get :show, id: @reestrprihodov
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reestrprihodov
    assert_response :success
  end

  test "should update reestrprihodov" do
    patch :update, id: @reestrprihodov, reestrprihodov: { givetobuh: @reestrprihodov.givetobuh, givetoruk: @reestrprihodov.givetoruk, kontragent: @reestrprihodov.kontragent, numbill: @reestrprihodov.numbill, numprihoddoc: @reestrprihodov.numprihoddoc, prihoddate: @reestrprihodov.prihoddate, sendwithpech: @reestrprihodov.sendwithpech }
    assert_redirected_to reestrprihodov_path(assigns(:reestrprihodov))
  end

  test "should destroy reestrprihodov" do
    assert_difference('Reestrprihodov.count', -1) do
      delete :destroy, id: @reestrprihodov
    end

    assert_redirected_to reestrprihodovs_path
  end
end
