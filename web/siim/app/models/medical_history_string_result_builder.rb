class MedicalHistoryStringResultBuilder
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def with_patient
		@result+= "#{@medical_history.patient.firstname}, #{@medical_history.patient.lastname}, #{@medical_history.patient.birthdate}, #{@medical_history.patient.height}, #{@medical_history.patient.weight}"
		self
	end

	def with_allergies
		@result = @medical_history.allergies.inject(@result) {|result, an_allergy |
			result+=  ", #{an_allergy.cause}"
			result+= ", #{an_allergy.observations}" unless an_allergy.observations.nil?
			result
		}
		self
	end

	def with_antecedents
		@result = @medical_history.antecedents.inject(@result) {|result, an_antecedent | "#{result},#{an_antecedent.description}"}
		self
	end

	def with_consultations
		@result = @medical_history.consultations.inject(@result) {|result, a_consultation |
			result+=  " ,#{a_consultation.diagnostic}"
			result+= ", #{a_consultation.symptomps}" unless a_consultation.symptomps.nil?
			result+= ", #{a_consultation.treatment}" unless a_consultation.treatment.nil?
			result
		}
		self
	end

	def with_diseases
		@result = @medical_history.diseases.inject(@result) {|result, a_disease |
			result+=  ", #{a_disease.name}"
			result+= ", #{a_disease.observations}" unless a_disease.observations.nil?
			result
		}
		self
	end

	def with_medications
		@result = @medical_history.medications.inject(@result) {|result, a_medication |
			result+=  ",#{a_medication.name}, #{a_medication.dose}, #{a_medication.amount}"
			result+= ",#{a_medication.route}" unless a_medication.route.nil?
			result
		}
		self
	end

	def with_vaccines
		@result = @medical_history.vaccines.inject(@result) {|result, a_vaccine | "#{result}, #{a_vaccine.name}"}
		self
	end

	def with_exams
		@result = @medical_history.medical_exams.inject(@result) {|result, an_exam |
			result+= ",#{an_exam.name}, #{an_exam.results}"
			result+= ",#{an_exam.observations}" unless an_exam.observations.nil?
			result
		}
		self
	end

	def with_all
		self.with_patient
		self.with_allergies
		self.with_antecedents
		self.with_consultations
		self.with_diseases
		self.with_medications
		self.with_vaccines
		self.with_exams
	end

	def to_s
		@result
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_medical_history)
		@medical_history = a_medical_history
		@result = ""
	end
end
