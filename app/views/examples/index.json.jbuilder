json.array!(@examples) do |example|
  json.extract! example, :id, :name, :price
  json.url example_url(example, format: :json)
end
