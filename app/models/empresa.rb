class Empresa < ActiveRecord::Base
  has_many :departamentos
  has_many :empregados, :through => :departamentos

	serialize :exemp_id, Array
end
