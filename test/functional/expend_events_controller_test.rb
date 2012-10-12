require 'test_helper'

class ExpendEventsControllerTest < ActionController::TestCase
  setup do
    @expend_event = expend_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expend_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expend_event" do
    assert_difference('ExpendEvent.count') do
      post :create, expend_event: { e_acom: @expend_event.e_acom, e_combine: @expend_event.e_combine, e_dcom: @expend_event.e_dcom, e_discount: @expend_event.e_discount, e_name: @expend_event.e_name, e_price: @expend_event.e_price, e_price: @expend_event.e_price, e_type: @expend_event.e_type, service_id: @expend_event.service_id }
    end

    assert_redirected_to expend_event_path(assigns(:expend_event))
  end

  test "should show expend_event" do
    get :show, id: @expend_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expend_event
    assert_response :success
  end

  test "should update expend_event" do
    put :update, id: @expend_event, expend_event: { e_acom: @expend_event.e_acom, e_combine: @expend_event.e_combine, e_dcom: @expend_event.e_dcom, e_discount: @expend_event.e_discount, e_name: @expend_event.e_name, e_price: @expend_event.e_price, e_price: @expend_event.e_price, e_type: @expend_event.e_type, service_id: @expend_event.service_id }
    assert_redirected_to expend_event_path(assigns(:expend_event))
  end

  test "should destroy expend_event" do
    assert_difference('ExpendEvent.count', -1) do
      delete :destroy, id: @expend_event
    end

    assert_redirected_to expend_events_path
  end
end
