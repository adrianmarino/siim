 module WebActions
  def login_as(a_value, a_password)
    @driver.navigate.to(@base_url + "/login")
    @driver.find_element(:id, "user_login").clear
    @driver.find_element(:id, "user_login").send_keys a_value

    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys a_password

    @driver.find_element(:name, "commit").click
  end

  def logout
    @driver.find_element(:css, "a.dropdown-toggle").click
    @driver.find_element(:css, "i.icon-off.icon-white").click
    @driver.find_element(:link, "Yes").click
  end
end