# -------------------------------------------------------------------------
# This module add acceptation test client to interact with the web 
# application to test.
# -------------------------------------------------------------------------
require "./test/acceptance/test_helper"

module AcceptanceTest
	include OutputHider
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def setup
		start_hide_output
		@driver = FirefoxWebdriveFactory.instance.new_driver 120,'/usr/local/firefox-selenium/firefox'
		@base_url = "http://localhost:3000"
	end

	def teardown
		@driver.quit
		stop_hide_output
	end
end