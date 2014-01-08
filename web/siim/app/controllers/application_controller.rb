class ApplicationController < ActionController::Base
	# -------------------------------------------------------------------------
	# Protected Methods...
	# -------------------------------------------------------------------------
	protected

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

  before_filter :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit( :dni, :email, :first_name, :last_name, :birthdate,
                :sex, :address, :movile_phone, :home_phone, :photo, :password,
                :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:dni, :email, :first_name, :last_name, :birthdate,
               :sex, :address, :movile_phone, :home_phone, :photo, :password,
               :password_confirmation, :password, :password_confirmation,
               :current_password)
    end
  end
end
