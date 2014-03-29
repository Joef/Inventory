class Recipe < ActiveRecord::Base
  has_many    :recipe_ingredients, dependent: :destroy
  has_many    :ingredients, :through => :recipe_ingredients
  
  accepts_nested_attributes_for :recipe_ingredients,
                    :reject_if => :all_blank,
                    :allow_destroy => true
  accepts_nested_attributes_for :ingredients
  
  before_save :calculate_total_price
  
  def total_price 
      recipe_ingredients.to_a.sum{|recipe_ingredient| recipe_ingredient.total_cost}
      
    end
    def calculate_total_price
      self.cost = total_price
    end
  
end
