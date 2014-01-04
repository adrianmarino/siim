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
		@driver = new_driver :firefox, 120
		@base_url = "http://localhost:3000"
	end

	def teardown
		@driver.quit
		stop_hide_output
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def new_driver(a_browser_name, a_wait_time)
		@driver = Selenium::WebDriver.for a_browser_name
		@driver.manage.timeouts.implicit_wait = a_wait_time
		@driver
	end
end