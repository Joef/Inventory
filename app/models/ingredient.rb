class Ingredient < ActiveRecord::Base
  has_many    :invoice_ingredients
  has_many    :invoices, :through => :invoice_ingredients
  
  has_many    :recipe_ingredients
  has_many    :recipes, :through => :recipe_ingredients
  
  has_many    :ingredients, class_name: "Ingredient",
              foreign_key: "parent_id" 
  
  belongs_to  :category
  belongs_to  :measure
  
  
  def self.order_by_category
    {:joins => "left join categories as c on c.id = ingredients.category_id",    :order => "c.name"}
  end
  
  def get_conversion(m_id)
    conversion = self.measure.conversions.where(measure_b_id: m_id).first
    return conversion.quantity if conversion
  end
  
  
end
