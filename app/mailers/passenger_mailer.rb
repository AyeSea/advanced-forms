class PassengerMailer < ApplicationMailer
	default from: 'admin@example.com'

	def confirmation_email(passenger)
		@passenger = passenger
		@booking = @passenger.bookings.last
		mail(to: @passenger.email, subject: 'Your Flight Confirmation')
	end
end