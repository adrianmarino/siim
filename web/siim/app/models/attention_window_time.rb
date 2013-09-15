class AttentionWindowTime
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.new_from(a_last_attention_date, a_window_size)
		return nil if a_last_attention_date > (Date.today + a_window_size.days)

		if a_last_attention_date < Date.today
			from = Date.today
			to = from + (a_window_size-1).days
		elsif a_last_attention_date == Date.today
			from = Date.today + 1.day
			to = Date.today + a_window_size.days
		elsif a_last_attention_date > Date.today
			from = a_last_attention_date + 1.day
			to = a_last_attention_date + (a_window_size.days - (a_last_attention_date - Date.today).days)
		end
		# puts "\nFrom: #{from}, To: #{to}"
		self.new from, to
	end

	def range
		from..to
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_reader :from, :to

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_from, a_to)
		@from = a_from
		@to = a_to
	end
end