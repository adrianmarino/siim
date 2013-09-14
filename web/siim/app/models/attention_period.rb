class AttentionPeriod < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def include?(a_time)
		a_time.after_begin_time_of?(self) && a_time.before_end_time_of?(self)
	end

	def begin_time_on(a_time)
		a_time.midnight +  begin_hour.hours + begin_minutes.minutes
	end

	def end_time_on(a_time)
		a_time.midnight + end_hour.hours + end_minutes.minutes
	end

	def ==(an_other)
		!an_other.nil? && 
		self.begin_hour == an_other.begin_hour &&
		self.begin_minutes == an_other.begin_minutes && 
		self.end_hour == an_other.end_hour &&
		self.end_minutes == an_other.end_minutes 
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
		 presence: true

end