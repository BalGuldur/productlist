json.array!(@orderstates) do |orderstate|
  json.extract! orderstate, :id, :state, :color
  json.url orderstate_url(orderstate, format: :json)
end
