json.array!(@images) do |image|
  json.extract! image, :id, :flickr_id, :owner, :title, :url
  json.url image_url(image, format: :json)
end
