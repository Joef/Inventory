class RestaurantController < ApplicationController
  def index
    @vendors = Vendor.order(:name)
  end
end
