class LogController < ApplicationController
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def show
    send_file APP_CONFIG.log_path, type: "application/text", :x_sendfile=>true
  end
end