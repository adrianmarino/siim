module TimeHelper
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.create_times(args)
		start_time = args[:start_time]
		end_time = args[:end_time]
		increment = args[:increment]
		count = increment_count start_time, end_time, increment

		log_args start_time, end_time, increment
		log_count count

		count.times.inject([]) do |times, number|
			time = next_time start_time, number, increment
			log_time time, number
			times << time
		end
	end


	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def self.increment_count(start_time, end_time, increment)
		(end_time.to_i - start_time.to_i) / increment.sum_of_hours_and_minutes_in_seconds
	end

	def self.next_time(start_time,i,increment)
		start_time + (i * increment.sum_of_hours_and_minutes_in_seconds)
	end

	def self.log_args(start_time, end_time, increment)
		puts "\nGenerate times from: #{start_time.strftime("%F %H:%M")} to #{end_time.strftime("%F %H:%M")} with step of #{increment.sum_of_hours_and_minutes_in_seconds} seconds."
	end

	def self.log_count(count)
		puts "\s-\sCount: #{count} times."
	end

	def self.log_time(time, number)
		puts "\s-\sTime #{number+1}: #{time.strftime("%F %H:%M")}."
	end
end