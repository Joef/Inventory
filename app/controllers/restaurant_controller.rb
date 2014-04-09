class RestaurantController < ApplicationController
  def index
    @vendors = Vendor.includes(:invoices).order(:name)
    @recipes = Recipe.includes(:recipe_ingredients).includes(:ingredients).order(:name)
  end
end
