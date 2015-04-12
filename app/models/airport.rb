class Airport < ActiveRecord::Base
	before_save :upcase_code

	has_many :departing_flights, class_name: "Flight", foreign_key: "start_id"
	has_many :arriving_flights, class_name: "Flight", foreign_key: "finish_id"

	validates :code, presence: true


	private
		def upcase_code
			self.code = code.upcase
		end
end
