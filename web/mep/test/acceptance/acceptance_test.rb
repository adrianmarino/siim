module AcceptanceTest
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
  def setup
  	# reset
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 60

    @base_url = "http://localhost:3000"
  end
  
  def teardown
    @driver.quit
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  private
  def reset
  	puts 'Reset database...'
  	system 'rake db:reset RAILS_ENV=test'
  end
end