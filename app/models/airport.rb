class Airport < ActiveRecord::Base
	before_save :upcase_code
	validates :code, presence: true

	private
		def upcase_code
			self.code = code.upcase
		end
end
