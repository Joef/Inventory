require 'test_helper'

class InvoiceIngredientsControllerTest < ActionController::TestCase
  setup do
    @invoice_ingredient = invoice_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_ingredient" do
    assert_difference('InvoiceIngredient.count') do
      post :create, invoice_ingredient: { extended: @invoice_ingredient.extended, ingredient_id: @invoice_ingredient.ingredient_id, invoice_id: @invoice_ingredient.invoice_id, measure_id: @invoice_ingredient.measure_id, price: @invoice_ingredient.price, quantity: @invoice_ingredient.quantity }
    end

    assert_redirected_to invoice_ingredient_path(assigns(:invoice_ingredient))
  end

  test "should show invoice_ingredient" do
    get :show, id: @invoice_ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice_ingredient
    assert_response :success
  end

  test "should update invoice_ingredient" do
    patch :update, id: @invoice_ingredient, invoice_ingredient: { extended: @invoice_ingredient.extended, ingredient_id: @invoice_ingredient.ingredient_id, invoice_id: @invoice_ingredient.invoice_id, measure_id: @invoice_ingredient.measure_id, price: @invoice_ingredient.price, quantity: @invoice_ingredient.quantity }
    assert_redirected_to invoice_ingredient_path(assigns(:invoice_ingredient))
  end

  test "should destroy invoice_ingredient" do
    assert_difference('InvoiceIngredient.count', -1) do
      delete :destroy, id: @invoice_ingredient
    end

    assert_redirected_to invoice_ingredients_path
  end
end
