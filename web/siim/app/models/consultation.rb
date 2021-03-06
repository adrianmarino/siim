class Consultation < ActiveRecord::Base
	# -------------------------------------------------------------------------
	# Public Class Methods...
	# -------------------------------------------------------------------------
	def self.all_achievement_years
		consultations = select('DISTINCT achievement_date').order("achievement_date desc")
		(consultations.collect {|a_result| a_result.achievement_date.year }).uniq
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :achievement_date, :diagnostic, :symptomps, :treatment,
		:medical, :medical_id, :medical_history, :medical_history_id

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	belongs_to :medical
	belongs_to :medical_history, touch: true

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :achievement_date, :diagnostic, :medical, presence: true
end