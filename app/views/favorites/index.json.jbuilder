json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :product_id, :customer_id
  json.url favorite_url(favorite, format: :json)
end
