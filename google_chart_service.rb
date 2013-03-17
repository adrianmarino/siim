require 'httparty'

class GoogleChartService
	include HTTParty

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def generate_qr(a_text, a_dimention, a_encoding = 'UTF-8', an_error_correction_level = 'L')
		generate a_text, a_dimention, a_encoding, an_error_correction_level
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize
		self.class.base_uri 'https://chart.googleapis.com/chart?'
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def generate(a_text, a_dimention, a_encoding, an_error_correction_level)
		self.class.get 'cht=qr' , :query => { :chs => a_dimention, :chl => a_text, :choe => a_encoding, :chld => an_error_correction_level}
	end
end