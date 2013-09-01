module Assertions
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def assert_not_empty_collection(a_collection)
		assert !a_collection.empty?,"Empty colllection!"
	end
end