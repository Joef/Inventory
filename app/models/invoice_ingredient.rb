class InvoiceIngredient < ActiveRecord::Base
  belongs_to  :measure
  belongs_to  :invoice
  belongs_to  :ingredient
  
  before_save :update_last_price
  
  accepts_nested_attributes_for :ingredient,
                                :reject_if => :all_blank
                                
  validates :ingredient_id, :measure_id, presence: true
  validates :price, :extended, numericality: {greater_than_or_equal_to: 0.01}
  
  UNIT_TYPES = [ "CS", "EA", "PC", "BAG", "BX", "GAL"]
  PACK_TYPES = [ "CT", "LB", "OZ", "DZ", "GAL", "PINT", "BUNCH", "TRAY" ]
  
  def update_last_price
    ingredient = self.ingredient
    
    conversion = 60 #Conversion.get_smallest(self.measure_id)
    ingredient.last_price = self.extended / conversion
    ingredient.save
  end
end
