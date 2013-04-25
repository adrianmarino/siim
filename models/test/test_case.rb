require 'test/unit'

module Test
	module Unit
		class TestCase
			def assert_within_range(a_value, a_start_value, an_end_value)
				assert( (a_value >= a_start_value.to_f) & (a_value <= an_end_value.to_f) )
			end
		end
	end
end