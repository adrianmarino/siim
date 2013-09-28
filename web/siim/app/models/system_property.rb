class SystemProperty < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.window_size
		self.find_by_name(WINDOW_SIZE)
	end

	def self.window_size_value
		self.window_size.value.to_i
	end

	def self.new_window_size(a_value)
		SystemProperty.new(name: WINDOW_SIZE, value: a_value.to_s)
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :name, :value

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :name, presence: true

	# ----------------------------------------------------------------------------
	# Constants
	# ----------------------------------------------------------------------------
	WINDOW_SIZE = :window_size
end
