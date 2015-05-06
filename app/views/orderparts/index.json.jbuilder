json.array!(@orderparts) do |orderpart|
  json.extract! orderpart, :id, :partnum, :descr, :qty, :psaleprice, :distrib, :doner_id, :state_id, :panswtime_id, :rezprice, :rezpricetype_id, :reztime_id, :nds, :beznal, :pshiptime_id, :shipprice, :convertion, :pmargin, :comment, :order_id
  json.url orderpart_url(orderpart, format: :json)
end
