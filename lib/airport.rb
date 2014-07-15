require './lib/weather'

class Airport

	include Weather

	def initialize(capacity)
		@planes ||= []
		@capacity = capacity
	end

	attr_reader :capacity, :planes

	def land(plane)
		return "Plane cannot land in a storm. Please keep flying." unless good_weather?
		return "The aiport is full. Keep on flying." if full?
		@planes << plane
	end
	
	def take_off(plane)
		return "A storm is brewing. Please stay landed." unless good_weather?
		@planes.delete(plane)
		plane.take_off_from(self)
		nil
	end

	def full?
		@planes.count == capacity
	end

	def take_off_all_planes
		while planes.any?
			planes.each do |plane|
				take_off(plane)
			end
		end
	end

end