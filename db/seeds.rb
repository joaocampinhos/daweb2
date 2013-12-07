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
    {:name => "Beleza", :empregados => [
      {:name => "Francisco", :email => "a@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 1},
      {:name => "Fanny", :email => "b@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 2}
    ]},
    {:name => "Gostosas", :empregados => [
      {:name => "Jennifer", :email => "c@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 3},
      {:name => "Katy", :email => "d@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 4}
    ]}
  ]},
  {:name => "MicroCenas", :departamentos => [
    {:name => "Canalização", :empregados => [
      {:name => "Manel", :email => "e@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 5}
    ]}
  ]}
]

##########
# Empresas, departamentos e empregados
empresas.each do |e|
  e_obj = Empresa.create(name: e[:name])
  e[:departamentos].each do |d|
    d_obj = Departamento.create(name: d[:name], empresa_id: e_obj.id)
    d[:empregados].each do |emp|
      Empregado.create(name: emp[:name], email: emp[:email], password: emp[:password], password_confirmation: emp[:password_confirmation], departamento_id: d_obj.id, image: emp[:image])
    end
  end
end

##########
# Contactos entre os empregados
chicoid = Empregado.find_by(name: 'Francisco').id
Contacto.create(empregado_id: chicoid, amigo_id: Empregado.find_by(name: 'Fanny').id, pendente: false)
Contacto.create(empregado_id: chicoid, amigo_id: Empregado.find_by(name: 'Jennifer').id, pendente: false)
Contacto.create(empregado_id: chicoid, amigo_id: Empregado.find_by(name: 'Katy').id, pendente: true)

