json.array!(@intproducts) do |intproduct|
  json.extract! intproduct, :id, :name, :partnumber, :serialnumber, :prodtype_id, :employee_id
  json.url intproduct_url(intproduct, format: :json)
end
