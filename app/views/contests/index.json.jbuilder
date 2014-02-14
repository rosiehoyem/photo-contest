json.array!(@contests) do |contest|
  json.extract! contest, :id, :name, :active_round, :posted
  json.url contest_url(contest, format: :json)
end
