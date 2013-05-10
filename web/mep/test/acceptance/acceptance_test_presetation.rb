require 'headless'

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