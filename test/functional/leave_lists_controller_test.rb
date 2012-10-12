require 'test_helper'

class LeaveListsControllerTest < ActionController::TestCase
  setup do
    @leave_list = leave_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_list" do
    assert_difference('LeaveList.count') do
      post :create, leave_list: { leave_type: @leave_list.leave_type, subtract_money: @leave_list.subtract_money }
    end

    assert_redirected_to leave_list_path(assigns(:leave_list))
  end

  test "should show leave_list" do
    get :show, id: @leave_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_list
    assert_response :success
  end

  test "should update leave_list" do
    put :update, id: @leave_list, leave_list: { leave_type: @leave_list.leave_type, subtract_money: @leave_list.subtract_money }
    assert_redirected_to leave_list_path(assigns(:leave_list))
  end

  test "should destroy leave_list" do
    assert_difference('LeaveList.count', -1) do
      delete :destroy, id: @leave_list
    end

    assert_redirected_to leave_lists_path
  end
end
