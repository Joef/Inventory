class Measure < ActiveRecord::Base
  
  has_many      :conversions, :foreign_key => :measure_a_id, :dependent => :destroy
  has_many      :measures, :through => :conversions, :source => :measure_b
  
  validates     :name, :abbreviation, :volume_weight, :english_metric, presence: true
  #validates     :name, uniqueness: true
  
  VOLUME_WEIGHT = ["Volume", "Weight"]
  MEASURE_TYPE = ["US", "Metric"]
  
  
 
end
