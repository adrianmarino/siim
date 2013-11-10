# -----------------------------------------------------------------------------
# Generates a random string from a set of easily readable characters
# -----------------------------------------------------------------------------
module PasswordGenerator
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.password(a_size)
		charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z a c d e f g h j k m n p q r t v w x y z}
		(0...a_size).map{ charset.to_a[rand(charset.size)] }.join
	end
end
