json.array!(@colors) do |color|
  json.extract! color, :id, :name, :hex, :if
  json.url color_url(color, format: :json)
end
