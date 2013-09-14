module Assertions
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def assert_not_empty(a_collection)
		assert !a_collection.empty?,"Empty colllection!"
	end

	def assert_has_only_one(a_collection)
		assert a_collection.one?, "Collection has not only one element!. #{a_collection.all}"
	end
end