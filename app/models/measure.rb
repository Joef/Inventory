class Measure < ActiveRecord::Base
  
  has_many      :conversions, :foreign_key => :measure_a_id, :dependent => :destroy
  has_many      :measures, :through => :conversions, :source => :measure_b
  
  def name_plural
    "#{name}(s)"
  end
end