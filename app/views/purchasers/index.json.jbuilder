json.array!(@purchasers) do |purchaser|
  json.extract! purchaser, :id, :name, :phone, :employee_id
  json.url purchaser_url(purchaser, format: :json)
end
