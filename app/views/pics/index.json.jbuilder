json.array!(@pics) do |pic|
  json.extract! pic, :id, :name, :description, :url, :created_at, :updated_at
  json.url pic_url(pic, format: :json)
end
