json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :category_id, :last_price
  json.url ingredient_url(ingredient, format: :json)
end
