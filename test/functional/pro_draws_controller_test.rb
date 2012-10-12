require 'test_helper'

class ProDrawsControllerTest < ActionController::TestCase
  setup do
    @pro_draw = pro_draws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pro_draws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pro_draw" do
    assert_difference('ProDraw.count') do
      post :create, pro_draw: { draw_name: @pro_draw.draw_name, draw_num: @pro_draw.draw_num, draw_type: @pro_draw.draw_type, notes: @pro_draw.notes, product_id: @pro_draw.product_id, user_id: @pro_draw.user_id }
    end

    assert_redirected_to pro_draw_path(assigns(:pro_draw))
  end

  test "should show pro_draw" do
    get :show, id: @pro_draw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pro_draw
    assert_response :success
  end

  test "should update pro_draw" do
    put :update, id: @pro_draw, pro_draw: { draw_name: @pro_draw.draw_name, draw_num: @pro_draw.draw_num, draw_type: @pro_draw.draw_type, notes: @pro_draw.notes, product_id: @pro_draw.product_id, user_id: @pro_draw.user_id }
    assert_redirected_to pro_draw_path(assigns(:pro_draw))
  end

  test "should destroy pro_draw" do
    assert_difference('ProDraw.count', -1) do
      delete :destroy, id: @pro_draw
    end

    assert_redirected_to pro_draws_path
  end
end
