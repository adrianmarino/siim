require 'headless'
# -------------------------------------------------------------------------
# This module has the responsibility of hide web browser during acceptance 
# test. Usefull to use in regresion tests on jenkins continum integration
# server.
# -------------------------------------------------------------------------
module OutputHider
	# -------------------------------------------------------------------------
	# Ptotected Methods...
	# -------------------------------------------------------------------------
	protected
	def start_hide_output
		if show_output?
			puts 'Hide test output...'
			@headless = Headless.new
			@headless.start
		end
	end

	def stop_hide_output
		@headless.destroy if show_output?
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def show_output?
		ENV['SHOW_OUTPUT'] == "true"
	end
end