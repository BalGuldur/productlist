json.array!(@prodtypes) do |prodtype|
  json.extract! prodtype, :id, :name
  json.url prodtype_url(prodtype, format: :json)
end
