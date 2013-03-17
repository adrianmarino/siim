require './distance_time_response'
require 'httparty'

# -------------------------------------------------------------------------
# Google Maps Web Service Client...
# -------------------------------------------------------------------------
class GoogleMapsServiceClient
	include HTTParty
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def distante_and_time(a_from_location, a_to_location, a_travel_mode)
		json_response = find a_from_location, a_to_location, a_travel_mode
		wrapp_response json_response
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_reader :language

	# -------------------------------------------------------------------------
	# Constructor...
	# -------------------------------------------------------------------------
	def	initialize(a_language)
		@language = a_language
		self.class.base_uri 'http://maps.googleapis.com/maps/api'
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def find(a_from_location, a_to_location, a_travel_mode)
		self.class.get '/distancematrix/json', :query => { :origins => a_from_location, :destinations=> a_to_location, :language => @language, :mode => a_travel_mode, :sensor=> false }
	end

	def wrapp_response(a_json_response)
		DistanceTimeResponse.new a_json_response
	end
end