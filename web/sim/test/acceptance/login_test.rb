require "./test/acceptance/test_helper"

class TestLogin < Test::Unit::TestCase
  include AcceptanceTest

  # -------------------------------------------------------------------------
  # Test Methods...
  # -------------------------------------------------------------------------

  def test_login
    @base_url = "http://localhost:3000"

    @driver.navigate.to(@base_url + "/login")
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_password").clear

    @driver.find_element(:id, "user_email").send_keys "adrianmarino@gmail.com"
    @driver.find_element(:id, "user_password").send_keys "29042902"

    @driver.find_element(:name, "commit").click

    @driver.find_element(:css, "a.dropdown-toggle").click
    @driver.find_element(:css, "i.icon-off.icon-white").click
    @driver.find_element(:link, "Yes").click
  end
end