json.array!(@statereservs) do |statereserv|
  json.extract! statereserv, :id, :status, :color
  json.url statereserv_url(statereserv, format: :json)
end
