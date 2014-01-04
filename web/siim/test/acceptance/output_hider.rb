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
		if not hide_output?
			puts 'Hide test output...'
			@headless = Headless.new
			@headless.start
		end
	end

	def stop_hide_output
		@headless.destroy if hide_output?
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def hide_output?
		show_output_env_var.nil? or show_output_env_var == "false"
	end

	def show_output_env_var
		ENV['SHOW_OUTPUT']
	end
end