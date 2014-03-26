class RestaurantController < ApplicationController
  def index
    @vendors = Vendor.includes(:invoices).order(:name)
  end
end
