class MedicalHistoryStringResultBuilder
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def with_patient
		@result+= "#{patient_firstname}, #{patient_lastname}, #{patient_birthdate}, #{patient_height}, #{patient_weight}"
		self
	end

	def with_allergies
		@result = @medical_history.allergies.inject(@result) {|result, an_allergy |
			result+=  ", #{allergy_cause(an_allergy)}"
			result+= ", #{allergy_observations(an_allergy)}" if !an_allergy.observations.nil? and !an_allergy.observations.empty?
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
			result+=  " ,#{consultation_diagnostic(a_consultation)}"
			result+= ", #{consultation_symptomps(a_consultation)}" unless a_consultation.symptomps.nil? or a_consultation.symptomps.empty?
			result+= ", #{consultation_treatment(a_consultation)}" unless a_consultation.treatment.nil? or a_consultation.treatment.empty?
			result
		}
		self
	end

	def with_diseases
		@result = @medical_history.diseases.inject(@result) {|result, a_disease |
			result+=  ", #{disease_name(a_disease)}"
			result+= ", #{disease_observations(a_disease)}" unless a_disease.observations.nil? or a_disease.observations.empty?
			result
		}
		self
	end

	def with_medications
		@result = @medical_history.medications.inject(@result) {|result, a_medication |
			result+=  ", #{medication_name(a_medication)}, #{medication_dose(a_medication)}, #{medication_amount(a_medication)}"
			result+= ", #{medication_route(a_medication)}" unless a_medication.route.nil? or a_medication.route.empty?
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
			result+= ", #{exam_name(an_exam)}, #{exam_results(an_exam)}"
			result+= ", #{exam_observations(an_exam)}" unless an_exam.observations.nil? or an_exam.observations.empty?
			result
		}
		self
	end

	def with_all
		self.with_patient.with_allergies.with_antecedents.with_consultations.with_diseases.with_medications.with_vaccines.with_exams
	end

	def to_s
		"...#{@result}..."
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def patient_firstname
		value_of "patient.firstname", @medical_history.patient.firstname
	end

	def patient_lastname
		value_of "patient.lastname", @medical_history.patient.lastname
	end

	def patient_birthdate
		value_of "patient.birthdate", @medical_history.patient.birthdate
	end

	def patient_height
		value_of "patient.height", @medical_history.patient.height
	end

	def patient_weight
		value_of "patient.weight", @medical_history.patient.weight
	end

	def allergy_cause(an_model)
		value_of "allergies.cause", an_model.cause
	end

	def allergy_observations(an_model)
		value_of "allergies.observations", an_model.observations
	end

	def consultation_treatment(a_model)
		value_of "consultations.treatment", a_model.treatment
	end

	def consultation_symptomps(a_model)
		value_of "consultations.symptomps", a_model.symptomps
	end

	def consultation_diagnostic(a_model)
		value_of "consultations.diagnostic", a_model.diagnostic
	end

	def disease_name(a_model)
		value_of "diseases.name", a_model.name
	end

	def disease_observations(a_model)
		value_of "diseases.observations", a_model.observations
	end

	def medication_name(a_model)
		value_of "medications.name", a_model.name
	end

	def medication_dose(a_model)
		value_of "medications.dose", a_model.dose
	end

	def medication_amount(a_model)
		value_of "medications.amount", a_model.amount
	end

	def medication_route(a_model)
		value_of "medications.route", a_model.route
	end

	def exam_name(a_model)
		value_of "medical_exams.name", a_model.name
	end

	def exam_results(a_model)
		value_of "medical_exams.results", a_model.results
	end

	def exam_observations(a_model)
		value_of "medical_exams.observations", a_model.observations 
	end

	def value_of(a_field_name, a_value)
		@highlight_wrapper.value_of a_field_name, a_value
	end

	def are_equal(a_highlight, a_value)
		remove_highlight(a_highlight) == a_value
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_medical_history)
		@medical_history = a_medical_history
		@result = ""
		@highlight_wrapper  = HighlightWrapper.new_with_default_tags @medical_history.highlight
	end
end