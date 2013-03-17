require 'test/unit'
require './google_chart_service'
require './image_file'

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

		# Show result...
		show_result image
	end

	def setup
		@target = GoogleChartService.new
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def show_result(an_image)
		ImageFile.new(an_image).write_on_file_named 'qr.png'
	end
end