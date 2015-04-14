class BookingsController < ApplicationController
	def new
		@flight = Flight.find_by(id: params[:flight_id])
		@booking = []
		params[:passengers] = "1" if params[:passengers].blank?
		params[:passengers].to_i.times { @booking << @flight.bookings.build }
	end

	def create
		@flight = Flight.find_by(id: params[:flight_id])
		@passenger = 	Passenger.new(name: params[:booking][:passengers][:name],
															 email: params[:booking][:passengers][:email])

		if @passenger.save
			@booking = @flight.bookings.build(passenger_id: @passenger.id)

			if @booking.save && @passenger.save
				flash[:success] = 'Flight was successfully booked!'
				redirect_to @booking
			else
				flash.now[:error] = 'Something went wrong! Please try again.'
				render 'new'
			end
		else
			flash.now[:error] = 'Something went wrong! Please try again.'
			render 'new'
		end
	end

	def show
		@flight = Booking.last.flight
		@start_airport = @flight.from_airport
		@end_airport = @flight.to_airport
		@passenger = Booking.last.passenger
	end

=begin
#whitelist params after figuring out how to get them from browser first
	private

		def booking_params
			params.require(:booking).permit(passenger_params)
		end

		def passenger_params
			params.require(:booking).require(:passengers).permit(:name, :email)
		end
=end
end
