class DistanceTimeResponse
	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	def distance
		@json_result['rows'][0]['elements'][0]['distance']['value'].to_f
	end

	def time
		@json_result['rows'][0]['elements'][0]['duration']['value'].to_f
	end

	def distance_text
		@json_result['rows'][0]['elements'][0]['distance']['text']
	end

	def time_text
		@json_result['rows'][0]['elements'][0]['duration']['text']
	end

	# -------------------------------------------------------------------------
	# Constructor...
	# -------------------------------------------------------------------------
	def initialize(a_json_result)
		@json_result = a_json_result
	end

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		"Distance: #{distance_text}, Time: #{time_text}"
	end
end