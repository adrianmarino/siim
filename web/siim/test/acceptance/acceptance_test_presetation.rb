require 'headless'
# -------------------------------------------------------------------------
# This module has the responsibility of hide web browser during acceptance 
# test. Usefull to use in regresion tests on jenkins continum integration
# server.
# -------------------------------------------------------------------------
module AcceptanceTestPresetation
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def hide_test_output
		if hide_output?
			puts 'Hide test output...'
			@headless = Headless.new
			@headless.start
		end
	end

	def stop_hide
		if hide_output?
			@headless.destroy
		end
	end

	def hide_output?
		not ENV['SHOW_TESTS'] == 'true'
	end
end