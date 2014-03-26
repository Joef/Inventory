class Category < ActiveRecord::Base
  has_many      :children, class_name: "Category", foreign_key: "parent_id"
  belongs_to    :parent, class_name: "Category"
  
  acts_as_tree
  
  has_many      :ingredients
  
  validates     :name, presence:true
  validates     :name, uniqueness: true
  
  #before_save   : #update custom field w/ true
   
  def self.find_all_others(category_id)
    self.where.not(id: category_id)
  end
  
  def select_display
    category = Category.all
     
    display_name = name
    
    c = self
    while !c.parent_id.nil? do
        c = category.find(c.parent) #really awful code will do a database call per
        display_name = "-" + display_name
        
      
    end
    return display_name
  end
  
  
  
  
end
