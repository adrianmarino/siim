require 'test/unit'
require 'qrtools'
require './google_chart_service'
require './image_file'
require './qr_decoder'

class GoogleChartServiceUnitTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_generate_qr
		# Prepare...
		dimension = '100x100'
		text = 'Hello'
		encoding = 'UTF-8'

		# Perform...
		image = @target.generate_qr text, dimension, encoding

		# Assert...
		assert_not_nil image
		assert_equal text, QRDecoder.decode_from_file(image)

		# Show result...
		show_result image
	end

	def setup
		@target = GoogleChartService.new
		File.delete 'qr.png'
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def show_result(an_image)
		ImageFile.new(an_image).write_on_file_named 'qr.png'
	end

	def decode_image(a_file_name)
  	image = QRTools::Image.load filename
  	QRTools::QRCode.decode image
	end
end
