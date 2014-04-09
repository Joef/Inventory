json.array!(@vendor_types) do |vendor_type|
  json.extract! vendor_type, :id, :name
  json.url vendor_type_url(vendor_type, format: :json)
end
