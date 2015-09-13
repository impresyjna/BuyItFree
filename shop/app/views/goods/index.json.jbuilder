json.array!(@goods) do |good|
  json.extract! good, :id, :title, :description, :price, :how_many
  json.url good_url(good, format: :json)
end
