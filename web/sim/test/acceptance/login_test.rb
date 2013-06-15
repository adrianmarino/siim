require "./test/acceptance/test_helper"

class TestLogin < Test::Unit::TestCase
  include AcceptanceTest
  include WebActions
  include WebAssertions

  # -------------------------------------------------------------------------
  # Test Methods...
  # -------------------------------------------------------------------------

  def test_login
    login_as "adrianmarino@gmail.com", "29042902"
    assert_login_as "Adrian Marino" 
    logout
  end

end