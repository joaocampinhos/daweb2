json.array!(@posts) do |post|
  json.extract! post, :empregado_id, :text, :image
  json.url post_url(post, format: :json)
end
