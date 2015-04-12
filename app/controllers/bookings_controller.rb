class BookingsController < ApplicationController
	def new
		@flight = Flight.find_by(id: params[:flight_id])
		@num_passengers = params[:passengers]
	end
end
