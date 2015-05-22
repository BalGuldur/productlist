json.array!(@distributors) do |distributor|
  json.extract! distributor, :id, :name
  json.url distributor_url(distributor, format: :json)
end
