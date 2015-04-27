json.array!(@employees) do |employee|
  json.extract! employee, :id, :fio, :department_id, :phone, :mobphone, :email, :job
  json.url employee_url(employee, format: :json)
end
