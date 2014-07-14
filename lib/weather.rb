module Weather

	def good_weather?
		 rand(10) >= 1		
	end

	def weather
		return "sunny" if good_weather?
		"stormy"
	end

end