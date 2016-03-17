json.array!(@agencies) do |agency|
  json.extract! agency, :id, :name, :email
  json.url agency_url(agency, format: :json)
end
