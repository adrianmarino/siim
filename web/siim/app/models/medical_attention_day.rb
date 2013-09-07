class MedicalAttentionDay < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :begin_time, :end_time, :name, :medical

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	belongs_to :medical

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :begin_time, :end_time, :name, presence: true
end