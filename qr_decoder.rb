require 'zxing'

class QRDecoder
	def self.from_file(a_image_path)
  		ZXing.decode a_image_path
	end
end