class Ingredient < ActiveRecord::Base
  has_many    :invoice_ingredients
  has_many    :invoices, :through => :invoice_ingredients
  
  has_many    :recipe_ingredients
  has_many    :recipes, :through => :recipe_ingredients
  
  has_many    :ingredients, class_name: "Ingredient",
              foreign_key: "parent_id" 
  
  belongs_to  :category
  
  
  
  def self.order_by_category
    {:joins => "left join categories as c on c.id = ingredients.category_id",    :order => "c.name"}
  end
end
