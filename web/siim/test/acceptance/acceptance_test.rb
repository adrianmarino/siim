# -------------------------------------------------------------------------
# This module add acceptation test client to interact with the web 
# application to test.
# -------------------------------------------------------------------------
require "./test/acceptance/test_helper"

module AcceptanceTest
  include AcceptanceTestPresetation

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------

  def setup
    hide_test_output
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 60
    @base_url = "http://localhost:3000"
    
  end

  def teardown
    @driver.quit
    stop_hide
  end
end