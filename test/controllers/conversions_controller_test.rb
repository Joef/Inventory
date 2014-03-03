require 'test_helper'

class ConversionsControllerTest < ActionController::TestCase
  setup do
    @conversion = conversions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversion" do
    assert_difference('Conversion.count') do
      post :create, conversion: { decimal: @conversion.decimal, measure_a_id: @conversion.measure_a_id, measure_b_id: @conversion.measure_b_id, quantity: @conversion.quantity }
    end

    assert_redirected_to conversion_path(assigns(:conversion))
  end

  test "should show conversion" do
    get :show, id: @conversion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conversion
    assert_response :success
  end

  test "should update conversion" do
    patch :update, id: @conversion, conversion: { decimal: @conversion.decimal, measure_a_id: @conversion.measure_a_id, measure_b_id: @conversion.measure_b_id, quantity: @conversion.quantity }
    assert_redirected_to conversion_path(assigns(:conversion))
  end

  test "should destroy conversion" do
    assert_difference('Conversion.count', -1) do
      delete :destroy, id: @conversion
    end

    assert_redirected_to conversions_path
  end
end
