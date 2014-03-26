class Category < ActiveRecord::Base
  has_many      :children, class_name: "Category", foreign_key: "parent_id"
  belongs_to    :parent, class_name: "Category"
  
  has_many      :ingredients
  
  validates     :name, presence:true
  validates     :name, uniqueness: true
  
  #before_save   : #update custom field w/ true
   
  def self.find_all_others(category_id)
    self.where.not(id: category_id)
  end
end
