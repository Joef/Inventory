class SubRecipe < ActiveRecord::Base
  belongs_to      :recipe_a, :class_name => :Recipe
  belongs_to      :recipe_b, :class_name => :Recipe
  
  validates       :recipe_a, :recipe_b, presence: true;
  validates       :servings, numericality: {greater_than_or_equal_to: 0.001}
  
  def serving_cost
    self.recipe_a.serving_cost * self.servings
  end
  
end
