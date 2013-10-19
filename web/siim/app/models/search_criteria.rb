module SearchCriteria
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.field(a_field,a_text)
		lambda do |should|
			should.string "#{a_field}:#{a_text}"
		end
	end
end