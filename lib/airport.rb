require './lib/weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 5

	def initialize(planes=[], capacity=DEFAULT_CAPACITY)
		@planes = planes
		@capacity = capacity
	end

	attr_accessor :capacity

	def has_planes?
		@planes.any?
	end

	def clear_for_landing(plane)
		return "The airport is full. Keep on flying." if full?
		return "A storm is brewing. Please keep flying." if stormy?
		@planes <<  plane.land!
	end

	def clear_for_take_off(plane)
		return "A storm is brewing. Please stay landed." if stormy?
		@planes.delete(plane.take_off!)
	end

	def full?
		@planes.count == capacity
	end


	# def take_off_all_planes
	# 	while planes.any?
	# 		planes.each do |plane|
	# 			take_off(plane)
	# 		end
	# 	end
	# end

end