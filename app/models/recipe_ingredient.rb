class RecipeIngredient < ActiveRecord::Base
  belongs_to  :measure
  belongs_to  :recipe
  belongs_to  :ingredient
  
  def unit_price
    if self.ingredient.measure_id
    if self.ingredient.measure_id != self.measure_id
      ratio = self.ingredient.get_conversion(self.measure_id)
    else
      ratio = 1
    end
    self.ingredient.last_price/ratio
    else
    0
    end
  end
  def total_cost
    if(self.unit_price && self.quantity)
      self.unit_price * self.quantity
    else
      0
    end
  end
  
  
  #crap
  def ingredient_name
    self.ingredient.name if !self.ingredient.nil?
  end
  def ingredient_measure_id
    self.ingredient.measure.id if !self.ingredient.measure.nil?
  end
  def ingredient_price_each
    self.ingredient.last_price if !self.ingredient.nil?
  end
end
