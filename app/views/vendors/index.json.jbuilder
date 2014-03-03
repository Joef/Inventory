json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name, :address_1, :address_2, :address_city, :address_state, :address_postal_code
  json.url vendor_url(vendor, format: :json)
end
