class RestaurantController < ApplicationController
  def index
    @kitchen = Vendor.includes(:invoices).where(vendor_type_id: 1).order(:name)
    @bar = Vendor.includes(:invoices).where(vendor_type_id: 2).order(:name)
    @recipes = Recipe.includes(:recipe_ingredients).includes(:ingredients).order(:name)
  end
end
