json.array!(@zakupkas) do |zakupka|
  json.extract! zakupka, :id, :numbill, :manager_id, :doner_id, :zakupkastate_id, :addrate, :sum, :margin, :comment, :arhive
  json.url zakupka_url(zakupka, format: :json)
end
