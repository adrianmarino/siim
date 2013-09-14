module TimeHelper
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.create_times(args)
		start_time = start_time args
		end_time = end_time args
		increment = increment args
		time = time args

		Array.new(1 + (end_time - start_time)/increment) do |i|
			time.midnight + (i*increment) + start_time
		end
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def self.start_time(args)
		args[:start_time] ? args[:start_time] : 0
	end

	def self.end_time(args)
		args[:end_time] ? args[:end_time] : 24.hours
	end

	def self.increment(args)
		args[:increment] ? args[:increment] : 30.minutes
	end

	def self.time(args)
		args[:time] ? args[:time] : Time.now
	end
end