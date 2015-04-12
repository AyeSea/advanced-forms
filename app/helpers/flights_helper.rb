module FlightsHelper
	def params_present?
	 params[:from].present? && params[:to].present? && params[:passengers].present? && params[:date].present?
	end
end
