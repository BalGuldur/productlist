json.array!(@zakupkaparts) do |zakupkapart|
  json.extract! zakupkapart, :id, :partnum, :descr, :qty, :psaleprice, :doner_id, :state_id, :rezprice, :rezpricetype_id, :nds, :beznal, :pshiptime_id, :shipprice, :convertion, :pmargin, :comment, :order_id, :distributor_id, :idorddistrib
  json.url zakupkapart_url(zakupkapart, format: :json)
end
