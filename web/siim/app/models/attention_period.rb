class AttentionPeriod < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def include?(a_time)
		a_time.after_begin_time_of?(self) && a_time.before_end_time_of?(self)
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :begin_hour, :begin_minutes, :end_hour, :end_minutes,
		:week_day, :medical

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	belongs_to :medical

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :begin_hour, :begin_minutes,:end_hour, :end_minutes, :week_day,
		:medical, presence: true

end