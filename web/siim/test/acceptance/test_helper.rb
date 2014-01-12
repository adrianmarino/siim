ENV["RAILS_ENV"] = "test"

require "selenium-webdriver"
require "test/unit"

require "./test/acceptance/web_actions"
require "./test/acceptance/web_assertions"
require "./test/acceptance/output_hider"
require "./test/acceptance/firefox_webdrive_factory"
require "./test/acceptance/acceptance_test"
