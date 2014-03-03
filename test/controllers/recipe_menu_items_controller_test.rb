require 'test_helper'

class RecipeMenuItemsControllerTest < ActionController::TestCase
  setup do
    @recipe_menu_item = recipe_menu_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_menu_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_menu_item" do
    assert_difference('RecipeMenuItem.count') do
      post :create, recipe_menu_item: { menu_item_id: @recipe_menu_item.menu_item_id, recipe_id: @recipe_menu_item.recipe_id }
    end

    assert_redirected_to recipe_menu_item_path(assigns(:recipe_menu_item))
  end

  test "should show recipe_menu_item" do
    get :show, id: @recipe_menu_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_menu_item
    assert_response :success
  end

  test "should update recipe_menu_item" do
    patch :update, id: @recipe_menu_item, recipe_menu_item: { menu_item_id: @recipe_menu_item.menu_item_id, recipe_id: @recipe_menu_item.recipe_id }
    assert_redirected_to recipe_menu_item_path(assigns(:recipe_menu_item))
  end

  test "should destroy recipe_menu_item" do
    assert_difference('RecipeMenuItem.count', -1) do
      delete :destroy, id: @recipe_menu_item
    end

    assert_redirected_to recipe_menu_items_path
  end
end
