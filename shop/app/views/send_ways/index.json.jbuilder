json.array!(@send_ways) do |send_way|
  json.extract! send_way, :id, :name, :good_id, :how_many_days, :price
  json.url send_way_url(send_way, format: :json)
end
