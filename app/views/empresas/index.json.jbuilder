json.array!(@empresas) do |empresa|
  json.extract! empresa, :name
  json.url empresa_url(empresa, format: :json)
end
