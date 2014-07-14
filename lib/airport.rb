
class Airport

	def initialize(capacity)
		@planes ||= []
		@capacity = capacity
		# @weather = "sunny"
	end

	attr_reader :capacity 
	# attr_accessor :weather

	def land(plane)
		raise "Plane cannot land in a storm. Please keep flying." if weather == "stormy"
		raise "The aiport is full. Keep on flying." if full?
		@planes << plane
	end
	
	def take_off(plane)
		raise "A storm is brewing. Please stay landed." if weather == "stormy"
		@planes.delete(plane)
		plane.take_off
		nil
	end

	def full?
		@planes.count == capacity
	end

end