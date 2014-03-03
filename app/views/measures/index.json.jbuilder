json.array!(@measures) do |measure|
  json.extract! measure, :id, :name, :abbreviation
  json.url measure_url(measure, format: :json)
end
