class AvailableAttentionTimeBuilder

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def build
		from_to_range.each do |a_date|
			@medicals.each do |a_medical|
				begin_hour = a_medical.attention_period.begin_hour
				begin_minutes = a_medical.attention_period.begin_minutes


			end
		end
		
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	def from_to_range
		from.as_date..to.as_date
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessor :from, :to, :medicals

end