json.array!(@conversions) do |conversion|
  json.extract! conversion, :id, :measure_a_id, :measure_b_id, :quantity, :decimal
  json.url conversion_url(conversion, format: :json)
end
