class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  before_filter :setup_locale
  def setup_locale
    I18n.locale = HTTPHeaderLocaleExtractor.new(request,logger).extract_locale
  end
end
