class RecipeIngredient < ActiveRecord::Base
  belongs_to  :measure
  belongs_to  :recipe
  belongs_to  :ingredient
end
