json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :category_id, :last_price, :measure_id
  json.measure ingredient.measure, :id, :name, :abbreviation if !ingredient.measure.nil?
  json.url ingredient_url(ingredient, format: :json)
end
