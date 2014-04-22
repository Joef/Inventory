class InvoiceIngredient < ActiveRecord::Base
  belongs_to  :measure
  belongs_to  :invoice
  belongs_to  :ingredient
  
  delegate :invoice_date, :to=>:date, :prefix=>true, :allow_nil=>true
  
  before_save :update_last_price
  
  accepts_nested_attributes_for :ingredient,
                                :reject_if => :all_blank
                                
  validates :ingredient_id, :measure_id, presence: true
  validates :price, :extended, numericality: {greater_than_or_equal_to: 0.00}
  
  UNIT_TYPES = [ "CS", "EA", "PC", "BAG", "BX", "GAL"]
  PACK_TYPES = [ "CT", "LB", "OZ", "DZ", "GAL", "PINT", "BUNCH", "TRAY" ]
  
  def price_per_unit
    if cost_basis == 0
      if(qty_shipped * pack_qty * pack_size) > 0
        extended / (qty_shipped * pack) 
      else
        0
      end  
    else
      extended / (pack)
    end
  end
  def ingredient_name
    self.ingredient.name if !self.ingredient.nil?
  end
  def update_last_price
    
    ingredient.last_price = price_per_unit
    ingredient.measure_id = measure_id
  end
  def pack
    pack_qty * pack_size 
  end
  
  
end
