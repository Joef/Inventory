class Vendor < ActiveRecord::Base
  has_many    :invoices
  validates   :name, presence: true
  validates   :name, uniqueness: true
  
  def total_spend
    year = Time.now.year
    Vendor.invoices.where(['invoice_date > ?', year])
  end
end
