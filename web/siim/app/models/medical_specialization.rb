class MedicalSpecialization < ActiveRecord::Base
	include Comparable

	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def to_s
		name
	end

	def <=>(an_other)
		if self.to_s < an_other.to_s
			-1
		elsif self.to_s > an_other.to_s
			1
		else
			0
		end
	end

	before_destroy :determine_if_its_associated_with_some_medical?
	def determine_if_its_associated_with_some_medical?
		raise ModelHasAssociationsException unless medicals.empty?
	end

	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	has_many :medicals

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :name

	# -------------------------------------------------------------------------
	# Validations...
	# -------------------------------------------------------------------------
	validates :name, presence: true
	validates :name, uniqueness: true
end
