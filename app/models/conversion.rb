class Conversion < ActiveRecord::Base
  belongs_to      :measure_a, :class_name => :Measure
  belongs_to      :measure_b, :class_name => :Measure
  
  validates       :measure_a, :measure_b, presence: true;
  validates       :quantity, numericality: {greater_than_or_equal_to: 0.01}
  
end
