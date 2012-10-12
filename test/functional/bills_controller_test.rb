require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill" do
    assert_difference('Bill.count') do
      post :create, bill: { appoint: @bill.appoint, assistant: @bill.assistant, assistant_score: @bill.assistant_score, bill_final_price: @bill.bill_final_price, bill_price: @bill.bill_price, c_source: @bill.c_source, custom_id: @bill.custom_id, designer: @bill.designer, expend_event_id: @bill.expend_event_id }
    end

    assert_redirected_to bill_path(assigns(:bill))
  end

  test "should show bill" do
    get :show, id: @bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill
    assert_response :success
  end

  test "should update bill" do
    put :update, id: @bill, bill: { appoint: @bill.appoint, assistant: @bill.assistant, assistant_score: @bill.assistant_score, bill_final_price: @bill.bill_final_price, bill_price: @bill.bill_price, c_source: @bill.c_source, custom_id: @bill.custom_id, designer: @bill.designer, expend_event_id: @bill.expend_event_id }
    assert_redirected_to bill_path(assigns(:bill))
  end

  test "should destroy bill" do
    assert_difference('Bill.count', -1) do
      delete :destroy, id: @bill
    end

    assert_redirected_to bills_path
  end
end
