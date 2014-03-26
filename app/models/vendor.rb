class Vendor < ActiveRecord::Base
  has_many    :invoices
  validates   :name, presence: true
  validates   :name, uniqueness: true
  
  accepts_nested_attributes_for :invoices
  
  def total_spend
    year = Time.now.year 
    self.invoices.where(['invoice_date > ?', year]).sum('total')
  end
  def last_invoice
    
     self.invoices.order('invoice_date DESC').first
   
  end
end
