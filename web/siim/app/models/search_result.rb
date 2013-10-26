class SearchResult
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		@string
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_reader :entity, :raw

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(args)
		@entity = args[:entity]

		result = StringHighlightResult.new(highlight: args[:result].highlight,
																			separator: args[:separator],
																			begin_tag: args[:begin_tag],
																			end_tag: args[:end_tag])
		@raw = result.to_raw
		@string = result.to_s
	end
end