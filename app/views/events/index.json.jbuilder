json.array!(@events) do |event|
  json.extract! event, :id, :start_time, :end_date, :neighborhood_id, :user_id, :name, :body
  json.url event_url(event, format: :json)
end
