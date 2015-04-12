class FlightsController < ApplicationController
	def index
		@flight = Flight.new
		@airports = Airport.all.map { |airport| [airport.code, airport.id] }
		@num_passengers = [1, 2, 3, 4]

		dates = Flight.all.pluck(:start_datetime).sort
		@dates = dates.map { |date| date.strftime("%m/%d/%Y") }
		@dates.uniq!
	end
end
