class Plane
	
	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land!
		@flying = false
		self
	end

	def take_off!
		@flying = true
		self
	end

	def land_on(airport)
		airport.clear_for_landing(self)
	end

	def take_off_from(airport)
		airport.clear_for_take_off(self)
	end

end