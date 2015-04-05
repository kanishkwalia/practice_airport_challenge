class Airport

	attr_reader :planes, :capacity

	def initialize
		@planes, @capacity= [], 20
	end

	def land plane
		check_weather_for(__method__)
		raise "The airport is full" if full?
		plane.land!
		planes << plane
	end

	def take_off plane
		check_weather_for(__method__)
		plane.take_off
		planes.delete plane
	end

	def full?
		planes.count == capacity
	end

	def weather
		rand(10) > 2 ? "Sunny" : "Stormy"
	end

	def check_weather_for transit
		raise "You cant #{transit} in a storm" if weather == "Stormy"
	end
end