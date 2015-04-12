# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airports = %w{SFO NYC CHI MCO SEA}

airports.each do |airport|
	Airport.create(code: airport)
end

5.times do |n|
	airports = Airport.all
	depart_airport = airports.sample
	arrive_airport = airports.sample

	until arrive_airport != depart_airport
		arrive_airport = airports.sample
	end

	#Each flight is n days away from current date/time.
	start_datetime = DateTime.now + (n * 86400)
	#Each flight is n * 1 hour in duration
	duration = (n * 3600)
	Flight.create(start_id: 			depart_airport.id,
								finish_id:  		arrive_airport.id,
								start_datetime: start_datetime,
								duration: 			duration
								)
end