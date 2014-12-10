json.array!(@products) do |product|
  json.extract! product, :id, :productarticul, :productname, :distributor, :price, :nalichie
  json.url product_url(product, format: :json)
end
