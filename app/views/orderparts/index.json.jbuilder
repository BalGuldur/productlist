json.array!(@orderparts) do |orderpart|
  json.extract! orderpart, :id, :partnumber, :partdescr, :qty, :pricesell, :priceship, :shipper, :beznal, :convert, :predatetime, :faktdatetime, :statereserv_id, :nds
  json.url orderpart_url(orderpart, format: :json)
end
