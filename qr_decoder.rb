class QRDecoder
	def self.decode_from_file(a_file_name)
  	image = QRTools::Image.load filename
  	QRTools::QRCode.decode image
	end
end