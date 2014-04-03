json.array!(@invoice_ingredients) do |invoice_ingredient|
  json.extract! invoice_ingredient, :id, :invoice_id, :ingredient_id, :measure_id, :qty_ordered, :price, :extended, :qty_shipped, :brand, :item_number, :vendor_number, :description, :pack_qty, :pack_size, :unit
  json.ingredient invoice_ingredient.ingredient, :id, :name
  json.url invoice_ingredient_url(invoice_ingredient, format: :json)
end
