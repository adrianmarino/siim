class ApplicationController < ActionController::Base
  # protect_from_forgery
  # before_filter :setup_locale, :authenticate_user!

  def setup_locale
    I18n.locale = HTTPHeaderLocaleExtractor.new(request,logger).extract_locale
  end
end
