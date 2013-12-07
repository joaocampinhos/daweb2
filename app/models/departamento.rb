class Departamento < ActiveRecord::Base
  has_many :empregados
  belongs_to :empresa
end
