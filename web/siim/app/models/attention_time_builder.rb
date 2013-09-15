class AttentionTimeBuilder
	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessor :from, :to, :window_time, :medicals

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def build
		attention_times = []
		each_date_of_range do |a_date|
			each_medical do |a_medical|
				each_attention_time(a_medical, a_date) do |a_time|
					attention_times << AttentionTime.new_available(a_time, a_medical)
				end
			end
		end
		attention_times
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def from_to_range
		(from.nil? or to.nil?) ? window_time.range : from..to
	end

	def each_date_of_range
		from_to_range.each do |a_date|
			yield a_date
		end
	end

	def each_attention_time(a_medical, a_date)
		a_medical.attention_times_on(a_date).each do |a_time|
			yield a_time
		end
	end

	def each_medical
		@medicals.each do |a_medical|
			yield a_medical
		end
	end
end