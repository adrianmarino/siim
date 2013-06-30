=begin
  Extract string representation of locale from HTTP header of request.
=end
class HTTPHeaderLocaleExtractor
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def extract_locale
    log_accept_language_http_attribute
    locale = get_locale_from_accept_language_header
    log_selected_locale locale
    locale
  end

  # -------------------------------------------------------------------------
  # Constructor...
  # -------------------------------------------------------------------------
  def initialize(aRequest,aLogger,a_default_locale = 'en')
    @logger = aLogger
    @request = aRequest
    @default_locale = a_default_locale
  end

  private
    # -------------------------------------------------------------------------
    # Private Methods...
    # -------------------------------------------------------------------------
    attr_accessor :logger, :request

    def get_locale_from_accept_language_header
      attribute = @request.env[Language_header_attribute]
      attribute.nil? or attribute.empty? ? @default_locale : attribute.scan(Locale_Regex).first
    end

    def log_accept_language_http_attribute
      logger.debug "* Accept-Language: #{@request.env['HTTP_ACCEPT_LANGUAGE']}"
    end

    def log_selected_locale(aLocale)
      logger.debug "* Locale set to '#{aLocale}'"
    end


    # -------------------------------------------------------------------------
    # Constants
    # -------------------------------------------------------------------------
    Language_header_attribute = 'HTTP_ACCEPT_LANGUAGE'

    Locale_Regex = /^[a-z]{2}/

end
