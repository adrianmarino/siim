module WebAssertions
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def assert_login_as(an_username)
		assert_equal "Login as #{an_username}", @driver.find_element(:id,"session_menu").text
	end
end
