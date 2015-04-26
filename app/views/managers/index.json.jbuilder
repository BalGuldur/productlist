json.array!(@managers) do |manager|
  json.extract! manager, :id, :name, :sourname
  json.url manager_url(manager, format: :json)
end
