class Vendor < ActiveRecord::Base
  has_many    :invoices
  validates   :name, :vendor_type_id, presence: true
  validates   :name, uniqueness: true
  
  accepts_nested_attributes_for :invoices
  belongs_to  :vendor_type
  
  #scope :this_year where 
  
  def total_spend(year=nil)
    year = Time.now.year-1  if year.nil?
    self.invoices.where(['invoice_date > "?-01-01" AND invoice_date < "?-01-01"', year, year+1]).sum('total')
  end
  def last_invoice
    
     self.invoices.order('invoice_date DESC').first
   
  end
  def not_nil_and_empty(obj)
    !obj.nil? && !obj.empty?
  end
  def format_address
    str = address_1                   if not_nil_and_empty address_1
    str += ", " + address_2           if not_nil_and_empty address_2
    str += ", " + address_city        if not_nil_and_empty address_city
    str += ", " + address_state       if not_nil_and_empty address_state
    str += " "  + address_postal_code if not_nil_and_empty address_postal_code
  end
end
