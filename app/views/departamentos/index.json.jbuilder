json.array!(@departamentos) do |departamento|
  json.extract! departamento, :name, :empresa_id
  json.url departamento_url(departamento, format: :json)
end
