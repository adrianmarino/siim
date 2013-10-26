class HighlightWrapper
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def value_of(a_field_name, a_frase)
		if exist_highlight_for(a_field_name)
			puts "#{a_field_name} :#{a_frase}. TIENE Highlight"
			value = highlight_of(a_field_name).select do|a_highlihted_value|
				puts "a_highlihted_value :#{a_highlihted_value}"
				a_frase == remove_highlight_to(a_highlihted_value)
			end
			puts "VALUE :#{value}"
			value.empty? ? a_frase : value.first
		else
			a_frase
		end
	end

	def self.new_with_default_tags(a_highlight, indexes)
		self.new a_highlight, APP_CONFIG.highlight_begin, APP_CONFIG.highlight_end, indexes
	end
	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def highlight_of(a_field_name)
		values = (@indexes.collect {|an_index| @highlight["#{a_field_name}.#{an_index}"] }).select {|a_value| not a_value.nil? }
		values = values.collect {|a_value| a_value[0] }
	end

	def exist_highlight_for(a_field_name)
		not @highlight.nil? and not highlight_of(a_field_name).empty?
	end

	def remove_highlight_to(a_value)
		tmp_value = a_value.dup
		begin
			tmp_value.slice! @begin_tag
			end_tag = tmp_value.slice! @end_tag
		end while not end_tag.nil?
		tmp_value
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_highlight, a_begin_tag, an_end_tag, indexes)
		@highlight = a_highlight
		@begin_tag = a_begin_tag
		@end_tag = an_end_tag
		@indexes = indexes
	end
end
