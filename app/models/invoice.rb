class Invoice < ActiveRecord::Base
    belongs_to  :vendor
    has_many    :invoice_ingredients
    has_many    :ingredients, :through => :invoice_ingredients
       
    validates   :vendor_id, presence: true
       
    accepts_nested_attributes_for :invoice_ingredients,
                    :reject_if => :all_blank,
                    :allow_destroy => true
    accepts_nested_attributes_for :ingredients
                                    
    def total_price
      ingredients.to_a.sum{|ingredient| ingredient.price}
    end
end
