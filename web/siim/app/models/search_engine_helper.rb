module SearchEngineHelper
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.sanitize(a_search_string)
		# Escape special characters
		# http://lucene.apache.org/core/old_versioned_docs/versions/2_9_1/queryparsersyntax.html#Escaping Special Characters
		escaped_characters = Regexp.escape('\\+-&|!(){}[]^~*?:')
		a_search_string = a_search_string.gsub(/([#{escaped_characters}])/, '\\\\\1')

		# AND, OR and NOT are used by lucene as logical operators. We need
		# to escape them
		['AND', 'OR', 'NOT'].each do |word|
			escaped_word = word.split('').map {|char| "\\#{char}" }.join('')
			a_search_string = a_search_string.gsub(/\s*\b(#{word.upcase})\b\s*/, " #{escaped_word} ")
		end

		# Escape odd quotes
		quote_count = a_search_string.count '"'
		a_search_string = a_search_string.gsub(/(.*)"(.*)/, '\1\"\3') if quote_count % 2 == 1

		a_search_string
	end
end