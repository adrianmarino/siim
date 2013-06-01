class User < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		email
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :email, :password, :password_confirmation, :remember_me

	# -------------------------------------------------------------------------
	# Authorization Attributes...
	# -------------------------------------------------------------------------
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
