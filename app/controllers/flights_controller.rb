class FlightsController < ApplicationController
	def index
		@airports = Airport.all.map { |airport| [airport.code, airport.id] }
	
		@num_passengers = [1, 2, 3, 4]

		dates = Flight.pluck(:start_datetime).sort
		@dates = dates.map { |date| [date.strftime("%m/%d/%Y"), date.to_date] }.uniq
		
		@flights = Flight.search(flight_params)
	end

	def flight_params
		params.permit(:from, :to, :passengers, :date)
	end
end