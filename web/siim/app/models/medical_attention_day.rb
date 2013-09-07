class MedicalAttentionDay < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :begin_hour, :begin_minutes, :end_hour, :end_minutes, 
		:name, :medical

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	belongs_to :medical

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :begin_hour, :begin_minutes,:end_hour, :end_minutes, :name,
		:medical, presence: true
end