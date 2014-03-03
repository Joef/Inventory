class Vendor < ActiveRecord::Base
  has_many    :invoices
  validates   :name, presence: true
  validates   :name, uniqueness: true
end
