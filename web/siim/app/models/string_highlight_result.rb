class StringHighlightResult
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		"#{to_string highlighted_values, @sepatator}#{@sepatator}"
	end

	def to_raw
		"#{to_string raw_highlighted_values}"
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def raw_highlighted_values
		keys.collect {|a_key| "<b>#{a_key}:</b> #{@highlight[a_key][0]}</br>" }
	end

	def highlighted_values
		values = []
		raw_values = Set.new

		keys.each do |a_key|
			value =  @highlight[a_key][0]
			raw_value = raw_of value

			if not raw_values.include?(raw_value)
				raw_values.add raw_value
				values << value
			end
		end
		values
	end

	def raw_of(a_value)
		tmp_value = a_value.dup
		begin
			tmp_value.slice! @begin_tag
			end_tag = tmp_value.slice! @end_tag
		end while not end_tag.nil?
		tmp_value
	end

	def keys
		@highlight.keys
	end

	def to_string(values, a_sepatator = "")
		values.inject(@result){|a_result,a_value|"#{a_result}#{a_sepatator}#{a_value.strip}"}
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(args)
		@highlight = args[:highlight].to_hash
		@result = ""
		@sepatator = args[:separator]
		@begin_tag = args[:begin_tag]
		@end_tag = args[:end_tag]
	end
end