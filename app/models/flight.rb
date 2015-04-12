class Flight < ActiveRecord::Base
	belongs_to :from_airport, class_name: "Airport", foreign_key: :start_id
	belongs_to :to_airport, class_name: "Airport", foreign_key: :finish_id

	has_many :bookings
	has_many :passengers, through: :bookings

	def Flight.search(flight_params)
		return nil unless flight_params.present?
		start_id = flight_params[:from]
		finish_id = flight_params[:to]
		date = flight_params[:date].to_date

		flights = Flight.all.where(start_id: start_id,
															 finish_id: finish_id,
															 start_datetime: (date.beginning_of_day..date.end_of_day))

	end
end