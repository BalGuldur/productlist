json.array!(@orders) do |order|
  json.extract! order, :id, :manager_id, :numbill, :purchaser_id, :shipprice, :addrate, :datetimedone, :margin, :statereser_id, :comments
  json.url order_url(order, format: :json)
end
