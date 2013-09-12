module TimeHelper
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.create_times(parameters)
		start_time = start_time parameters
		end_time = end_time parameters
		increment = increment parameters
		date = date parameters

		Array.new(1 + (end_time - start_time)/increment) do |i|
			date.midnight + (i*increment) + start_time
		end
		puts "HOLA"
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def self.start_time(parameters)
		parameters[:start_time] ? parameters[:start_time] : 0
	end

	def self.end_time(parameters)
		parameters[:end_time] ? parameters[:end_time] : 24.hours
	end

	def self.increment(parameters)
		parameters[:increment] ? parameters[:increment] : 30.minutes
	end

	def self.date(parameters)
		parameters[:date] ? parameters[:date] : Time.now
	end

end