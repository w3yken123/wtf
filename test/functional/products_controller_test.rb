require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { distributor_id: @product.distributor_id, p_discount: @product.p_discount, p_name: @product.p_name, p_price: @product.p_price, p_stock: @product.p_stock, p_type: @product.p_type, p_unit: @product.p_unit }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { distributor_id: @product.distributor_id, p_discount: @product.p_discount, p_name: @product.p_name, p_price: @product.p_price, p_stock: @product.p_stock, p_type: @product.p_type, p_unit: @product.p_unit }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
