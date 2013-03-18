require 'test_helper'

class GoogleChartServiceUnitTest < Test::Unit::TestCase
	# -------------------------------------------------------------------------
	# Test Methods...
	# -------------------------------------------------------------------------
	def test_generate_qr
		# Prepare...
		dimension = '100x100'
		text = 'Hello World!'
		encoding = 'UTF-8'
		@file_name = 'qr.png'
		FileHelper.delete_if_exist @file_name

		# Perform...
		image = @target.generate_qr text, dimension, encoding
		
		# Assert...
		assert_not_nil image
		# assert_equal text, QRDecoder.from_file(@file_name)

		# Show Results...
		puts "Write QR image to #{@file_name}"
		write_result image, @file_name
	end

	def setup
		@target = GoogleChartService.new
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def write_result(an_image,a_path)
		ImageFile.new(an_image).write_on_file_named a_path
	end
end
