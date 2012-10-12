require 'test_helper'

class PayOffsControllerTest < ActionController::TestCase
  setup do
    @pay_off = pay_offs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_offs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_off" do
    assert_difference('PayOff.count') do
      post :create, pay_off: { pay_discount: @pay_off.pay_discount, pay_name: @pay_off.pay_name, pay_num: @pay_off.pay_num, pay_subtotal: @pay_off.pay_subtotal, pay_type: @pay_off.pay_type, pay_unit_price: @pay_off.pay_unit_price }
    end

    assert_redirected_to pay_off_path(assigns(:pay_off))
  end

  test "should show pay_off" do
    get :show, id: @pay_off
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_off
    assert_response :success
  end

  test "should update pay_off" do
    put :update, id: @pay_off, pay_off: { pay_discount: @pay_off.pay_discount, pay_name: @pay_off.pay_name, pay_num: @pay_off.pay_num, pay_subtotal: @pay_off.pay_subtotal, pay_type: @pay_off.pay_type, pay_unit_price: @pay_off.pay_unit_price }
    assert_redirected_to pay_off_path(assigns(:pay_off))
  end

  test "should destroy pay_off" do
    assert_difference('PayOff.count', -1) do
      delete :destroy, id: @pay_off
    end

    assert_redirected_to pay_offs_path
  end
end
