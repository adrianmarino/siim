class ImageFile
	# -------------------------------------------------------------------------
	# Private Methods...
	# ------------------------------------------------------------------------- 
	def write_on_file_named(a_file_name)
		File.open(a_file_name, 'wb') { |a_file| a_file.write(@image) }
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(an_image)
		@image = an_image
	end
end