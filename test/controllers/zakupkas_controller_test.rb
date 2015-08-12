require 'test_helper'

class ZakupkasControllerTest < ActionController::TestCase
  setup do
    @zakupka = zakupkas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zakupkas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zakupka" do
    assert_difference('Zakupka.count') do
      post :create, zakupka: { addrate: @zakupka.addrate, arhive: @zakupka.arhive, comment: @zakupka.comment, doner_id: @zakupka.doner_id, manager_id: @zakupka.manager_id, margin: @zakupka.margin, numbill: @zakupka.numbill, sum: @zakupka.sum, zakupkastate_id: @zakupka.zakupkastate_id }
    end

    assert_redirected_to zakupka_path(assigns(:zakupka))
  end

  test "should show zakupka" do
    get :show, id: @zakupka
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zakupka
    assert_response :success
  end

  test "should update zakupka" do
    patch :update, id: @zakupka, zakupka: { addrate: @zakupka.addrate, arhive: @zakupka.arhive, comment: @zakupka.comment, doner_id: @zakupka.doner_id, manager_id: @zakupka.manager_id, margin: @zakupka.margin, numbill: @zakupka.numbill, sum: @zakupka.sum, zakupkastate_id: @zakupka.zakupkastate_id }
    assert_redirected_to zakupka_path(assigns(:zakupka))
  end

  test "should destroy zakupka" do
    assert_difference('Zakupka.count', -1) do
      delete :destroy, id: @zakupka
    end

    assert_redirected_to zakupkas_path
  end
end
