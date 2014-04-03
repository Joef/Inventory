json.array!(@conversions) do |conversion|
  json.extract! conversion, :id, :measure_a_id, :measure_b_id, :quantity
  
end
