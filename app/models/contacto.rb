class Contacto < ActiveRecord::Base
  belongs_to :contacto
  belongs_to :amigo, :class_name => 'Contacto'
end
