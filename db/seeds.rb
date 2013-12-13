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
Post.delete_all
Cv.delete_all

empresas = [
  {:name => "Gente Bonita",  :logo => "company.jpg", :description => "A agencia de Modelos gente bonita é o expoente maximo das agencias de imagem em Portugal, tem por objectivo projectar modelos para os mais famosos desfiles de moda e mais cobiçados anuncios publicitários. Temos os melhores profissionais na Area e apenas os mais bonitos conseguem um lugar nesta agencia de prestígio mundial", :departamentos => [
    {:name => "Beleza", :empregados => [
      {:name => "Francisco", :email => "a@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 1, :location => "almada", :job => "gerente", :about => "nao sei bem se e isto que e pa fazer ou se ta bem feito", :owner => true},
      {:name => "Fanny", :email => "b@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 2, :location => "casa dos segredos", :job => "socialite", :about => "eu merecia ganhar a casa dos segredos"}
    ]},
    {:name => "Gostosas", :empregados => [
      {:name => "Jennifer", :email => "c@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 3, :location => "casa do xico", :about =>"espero que gostem do meu novo filme, hunger games 2"},
      {:name => "Katy", :email => "d@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 4, :location => "casa do campinhos", :job => "modelo"}
    ]}
  ]},
  {:name => "MicroCenas",  :description => "esta empresa é uma empresa de renome na area de todas as cenas que dao micro, e por isso afirmamos ser os microlideres", :logo => "microcenas.png", :departamentos => [
    {:name => "Canalização", :empregados => [
      {:name => "Manel", :email => "e@gmail.com", :password => "12345678", :password_confirmation => "12345678", :image => 5, :location => "usa", :job =>"canalizador", :about => "estou farto de ser canalizador, vou tentar um emprego na empresa gente bonita", :owner => true}
    ]}
  ]}
]

##########
# Empresas, departamentos e empregados
empresas.each do |e|
  e_obj = Empresa.create(name: e[:name],  logo: e[:logo], description: e[:description])
  e[:departamentos].each do |d|
    d_obj = Departamento.create(name: d[:name], empresa_id: e_obj.id)
    d[:empregados].each do |emp|
      Empregado.create(name: emp[:name], email: emp[:email], password: emp[:password], password_confirmation: emp[:password_confirmation], departamento_id: d_obj.id, image: emp[:image], location: emp[:location], job: emp[:job], about: emp[:about])
    end
  end
end

#Ownership
emp1 = Empresa.find_by(name: 'Gente Bonita')
emp1.owner_id = Empregado.find_by(name: 'Francisco').id
emp2 = Empresa.find_by(name: 'MicroCenas')
emp2.owner_id = Empregado.find_by(name: 'Manel').id
emp1.save
emp2.save

##########
# Contactos entre os empregados
chicoid = Empregado.find_by(name: 'Francisco').id
fannyid = Empregado.find_by(name: 'Fanny').id
jennyid = Empregado.find_by(name: 'Jennifer').id

Contacto.create(empregado_id: chicoid, amigo_id: fannyid, pendente: false)
Contacto.create(empregado_id: fannyid, amigo_id: chicoid, pendente: false)
Contacto.create(empregado_id: jennyid, amigo_id: chicoid, pendente: false)
Contacto.create(empregado_id: chicoid, amigo_id: jennyid, pendente: false)
Contacto.create(empregado_id: chicoid, amigo_id: Empregado.find_by(name: 'Katy').id, pendente: true)

Post.create(empregado_id: fannyid, text:"havia quem dissese que eu nao era uma princesa mas depois do que mostrei na casa dos segredos nao restam duvidas", image: "casadossegredos.jpg")

Cv.create(empregado_id: chicoid, exp:["lal" ,"al al"], academic: ["escola dos campeoes", "fct"], skills: ["maquina", "bom em tudo","pontual"])


