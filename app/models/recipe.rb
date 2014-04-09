class Recipe < ActiveRecord::Base
  has_many    :recipe_ingredients, dependent: :destroy
  has_many    :ingredients, :through => :recipe_ingredients
  belongs_to  :measure
  
  has_many    :recipes, class_name: "Recipe",
              foreign_key: "parent_id" 
  belongs_to  :parent, class_name: "Recipe"
  
  accepts_nested_attributes_for :recipe_ingredients,
                    :reject_if => :all_blank,
                    :allow_destroy => true
  accepts_nested_attributes_for :ingredients
  
  before_save :calculate_total_price
  
  def ingredient_cost 
    recipe_ingredients.to_a.sum{|recipe_ingredient| recipe_ingredient.total_cost}
  end
  
  def calculate_total_price
    #self.cost = ingredient_cost
  end
  def total_cost
    ingredient_cost
  end
  
end
