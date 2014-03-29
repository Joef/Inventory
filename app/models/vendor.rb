class Vendor < ActiveRecord::Base
  has_many    :invoices
  validates   :name, presence: true
  validates   :name, uniqueness: true
  
  accepts_nested_attributes_for :invoices
  
  #scope :this_year where 
  
  def total_spend(year=nil)
    year = Time.now.year-1  if year.nil?
    self.invoices.where(['invoice_date > "?-01-01" AND invoice_date < "?-01-01"', year, year+1]).sum('total')
  end
  def last_invoice
    
     self.invoices.order('invoice_date DESC').first
   
  end
end
