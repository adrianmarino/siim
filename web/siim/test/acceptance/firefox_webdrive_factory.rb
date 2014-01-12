require 'singleton'

class FirefoxWebdriveFactory
	include Singleton

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def new_driver(a_wait_time, a_binary_path = "/usr/bin/firefox")
		setup_bin_path a_binary_path
		new_web_driver a_wait_time
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def setup_bin_path(a_binary_path)
		Selenium::WebDriver::Firefox::Binary.path = a_binary_path
	end

	def new_web_driver(a_wait_time)
		driver = Selenium::WebDriver.for :firefox
		driver.manage.timeouts.implicit_wait = a_wait_time
		driver
	end

end