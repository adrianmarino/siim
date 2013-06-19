class SiimSessionController < Devise::SessionsController
  before_filter :setup_locale
  def setup_locale
    I18n.locale = HTTPHeaderLocaleExtractor.new(request,logger).extract_locale
  end
end