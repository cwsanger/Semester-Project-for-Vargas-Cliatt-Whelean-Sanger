json.array!(@businesses) do |business|
  json.extract! business, :id, :name, :email
  json.url business_url(business, format: :json)
end
