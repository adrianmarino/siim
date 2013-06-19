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
  	if enable_hide
  		puts 'Hide test output...'
  		@headless = Headless.new
    	@headless.start
  	end
  end

  def stop_hide
  	if enable_hide
    	@headless.destroy
    end
  end

  def enable_hide
  	ENV['SHOW_TESTS'] == 'yes' ? false : true
  end
end