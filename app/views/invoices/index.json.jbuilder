json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :number, :invoice_date, :vendor_id
  json.url invoice_url(invoice, format: :json)
end
