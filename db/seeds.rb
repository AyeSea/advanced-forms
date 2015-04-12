#Airports
airports = %w{SFO NYC CHI MCO SEA}

airports.each do |airport|
	Airport.create(code: airport)
end

#Flights
Flight.create(start_id: 			2,
							finish_id:  		4,
							start_datetime: DateTime.now,
							duration: 			9000
							)

Flight.create(start_id: 			2,
							finish_id:  		4,
							start_datetime: DateTime.now,
							duration: 			9000
							)

5.times do |n|
	airports = Airport.all
	depart_airport = airports.sample
	arrive_airport = airports.sample

	until arrive_airport != depart_airport
		arrive_airport = airports.sample
	end

	#Each flight is n days away from current date/time.
	start_datetime = DateTime.now + (n)
	#Each flight is n * 1 hour in duration
	duration = (n * 3600)
	Flight.create(start_id: 			depart_airport.id,
								finish_id:  		arrive_airport.id,
								start_datetime: start_datetime,
								duration: 			duration
								)
end