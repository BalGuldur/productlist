require 'test_helper'

class MoneytypesControllerTest < ActionController::TestCase
  setup do
    @moneytype = moneytypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moneytypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moneytype" do
    assert_difference('Moneytype.count') do
      post :create, moneytype: { curse: @moneytype.curse, name: @moneytype.name, znak: @moneytype.znak }
    end

    assert_redirected_to moneytype_path(assigns(:moneytype))
  end

  test "should show moneytype" do
    get :show, id: @moneytype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moneytype
    assert_response :success
  end

  test "should update moneytype" do
    patch :update, id: @moneytype, moneytype: { curse: @moneytype.curse, name: @moneytype.name, znak: @moneytype.znak }
    assert_redirected_to moneytype_path(assigns(:moneytype))
  end

  test "should destroy moneytype" do
    assert_difference('Moneytype.count', -1) do
      delete :destroy, id: @moneytype
    end

    assert_redirected_to moneytypes_path
  end
end
