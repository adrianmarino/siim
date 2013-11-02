class Role < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :name

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	has_many :assignments
	has_many :users, :through => :assignments
end
