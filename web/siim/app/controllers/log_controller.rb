class LogController < ApplicationController
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def show
    send_file log_path, type: "application/text"
  end

  # -------------------------------------------------------------------------
  # Private Methods...
  # -------------------------------------------------------------------------
  def log_path
  	puts "APP_CONFIG: #{APP_CONFIG}"
    APP_CONFIG['log_path'][Rails.env]
  end
end