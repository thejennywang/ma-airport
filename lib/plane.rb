class Plane
	
	def initialize
		@status = :flying
	end

	def status
		@status
	end

	def take_off_from(airport)
		return "You cannot take off when already flying." if @status == :flying
		@status = :flying
		airport.take_off(self)
		self
	end

	def land_on(airport)
		return "You cannot land when you're already landed." if @status == :landed
		@status = :landed
		airport.land(self)
		self
	end

end