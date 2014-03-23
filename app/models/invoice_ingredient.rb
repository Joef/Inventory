class InvoiceIngredient < ActiveRecord::Base
  belongs_to  :measure
  belongs_to  :invoice
  belongs_to  :ingredient
  
  accepts_nested_attributes_for :ingredient,
                                :reject_if => :all_blank
                                
  validates :ingredient_id, :measure_id, presence: true
  validates :price, :extended, numericality: {greater_than_or_equal_to: 0.01}
end
