json.array!(@recipe_menu_items) do |recipe_menu_item|
  json.extract! recipe_menu_item, :id, :recipe_id, :menu_item_id
  json.url recipe_menu_item_url(recipe_menu_item, format: :json)
end
