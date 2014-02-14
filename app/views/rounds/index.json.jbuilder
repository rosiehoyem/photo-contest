json.array!(@rounds) do |round|
  json.extract! round, :id, :number, :image_a, :image_b
  json.url round_url(round, format: :json)
end
