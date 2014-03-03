json.array!(@invoice_ingredients) do |invoice_ingredient|
  json.extract! invoice_ingredient, :id, :invoice_id, :ingredient_id, :measure_id, :quantity, :price, :extended
  json.url invoice_ingredient_url(invoice_ingredient, format: :json)
end
