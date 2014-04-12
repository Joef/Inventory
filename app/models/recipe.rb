class Recipe < ActiveRecord::Base
  has_many    :recipe_ingredients, dependent: :destroy
  has_many    :ingredients, :through => :recipe_ingredients
  belongs_to  :measure
  
  has_many      :sub_recipes, :foreign_key => :recipe_a_id, :dependent => :destroy
  has_many      :recipes, :through => :sub_recipes, :source => :recipe_b
  
  accepts_nested_attributes_for :recipe_ingredients,
                    :reject_if => :all_blank,
                    :allow_destroy => true
  accepts_nested_attributes_for :ingredients
  
  accepts_nested_attributes_for :sub_recipes,
                    :reject_if => :all_blank,
                    :allow_destroy => true
  accepts_nested_attributes_for :recipes
  
  before_save :calculate_total_price
  
  def ingredient_cost 
    recipe_ingredients.to_a.sum{|recipe_ingredient| recipe_ingredient.total_cost}
  end
  def sub_recipe_cost
    sub_recipes.to_a.sum{|sub_recipe| sub_recipe.serving_cost}
  end
  def calculate_total_price
    #self.cost = ingredient_cost
  end
  def total_cost
    serving_cost + sub_recipe_cost
  end
  def serving_cost
    ingredient_cost / serving_quantity
  end
  def margin(rate)
    total_cost/rate
  end
  
end
