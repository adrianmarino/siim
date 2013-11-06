class ApplicationController < ActionController::Base
	# -------------------------------------------------------------------------
	# Authorization...
	# -------------------------------------------------------------------------
	protect_from_forgery
	rescue_from CanCan::AccessDenied do |exception|
	redirect_to root_url, alert: t('authorization.access_denied')
	end

	# -------------------------------------------------------------------------
	# Locale resolution...
	# -------------------------------------------------------------------------
	before_filter :setup_locale, :authenticate_user!
	def setup_locale
		I18n.locale = HTTPHeaderLocaleExtractor.new(request,logger).extract_locale
	end
end
