# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Empresa.delete_all
Departamento.delete_all
Empregado.delete_all

empresas = [
  {:name => "Gente Bonita", :departamentos => [
    {:name => "Beleza", :empregados => ["Fanny","Francisco"]},
    {:name => "Gostosas", :empregados => ["Jennifer","Katy"]}
  ]},
  {:name => "MicroCenas", :departamentos => [
    {:name => "Canalização", :empregados => ["Campini"]}
  ]}
]

empresas.each do |e|
  e_obj = Empresa.create(name: e[:name])
  e[:departamentos].each do |d|
    d_obj = Departamento.create(name: d[:name], empresa_id: e_obj.id)
    d[:empregados].each do |emp|
      Empregado.create(name: emp, departamento_id: d_obj.id)
    end
  end
end
