json.array!(@contactos) do |contacto|
  json.extract! contacto, 
  json.url contacto_url(contacto, format: :json)
end
