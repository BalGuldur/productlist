require 'test_helper'

class IntproductsControllerTest < ActionController::TestCase
  setup do
    @intproduct = intproducts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intproducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intproduct" do
    assert_difference('Intproduct.count') do
      post :create, intproduct: { employee_id: @intproduct.employee_id, name: @intproduct.name, partnumber: @intproduct.partnumber, prodtype_id: @intproduct.prodtype_id, serialnumber: @intproduct.serialnumber }
    end

    assert_redirected_to intproduct_path(assigns(:intproduct))
  end

  test "should show intproduct" do
    get :show, id: @intproduct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @intproduct
    assert_response :success
  end

  test "should update intproduct" do
    patch :update, id: @intproduct, intproduct: { employee_id: @intproduct.employee_id, name: @intproduct.name, partnumber: @intproduct.partnumber, prodtype_id: @intproduct.prodtype_id, serialnumber: @intproduct.serialnumber }
    assert_redirected_to intproduct_path(assigns(:intproduct))
  end

  test "should destroy intproduct" do
    assert_difference('Intproduct.count', -1) do
      delete :destroy, id: @intproduct
    end

    assert_redirected_to intproducts_path
  end
end
