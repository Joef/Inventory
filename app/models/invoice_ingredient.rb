class InvoiceIngredient < ActiveRecord::Base
  belongs_to  :measure
  belongs_to  :invoice
  belongs_to  :ingredient
  
  accepts_nested_attributes_for :ingredient,
                                :reject_if => :all_blank
end
