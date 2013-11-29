json.array!(@empregados) do |empregado|
  json.extract! empregado, :name, :departamento_id
  json.url empregado_url(empregado, format: :json)
end
