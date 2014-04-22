class Invoice < ActiveRecord::Base
    belongs_to  :vendor
    has_many    :invoice_ingredients, dependent: :destroy
    has_many    :ingredients, :through => :invoice_ingredients
       
    validates   :vendor_id,:number, :invoice_date, presence: true
       
    accepts_nested_attributes_for :invoice_ingredients,
                    :reject_if => :all_blank,
                    :allow_destroy => true
    accepts_nested_attributes_for :ingredients
    
    
    before_save :calculate_total_price
    before_save :update_last_price
                                    
    def total_price 
      invoice_ingredients.to_a.sum{|invoice_ingredient| invoice_ingredient.extended}
      
    end
    def calculate_total_price
      self.total = total_price
    end
    def update_last_price
      invoice_ingredients.each do |ii|
        ii.update_last_price
      end
    end
end
