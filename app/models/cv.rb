class Cv < ActiveRecord::Base
		

	belongs_to :empregado

	serialize :exp, Array
	
	serialize :academic, Array
	serialize :skills, Array
	
end
