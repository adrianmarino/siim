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
		value_of @medical_history.patient.firstname, "patient.firstname"
	end

	def patient_lastname
		value_of @medical_history.patient.lastname, "patient.lastname"
	end

	def patient_birthdate
		value_of @medical_history.patient.birthdate, "patient.birthdate"
	end

	def patient_height
		value_of @medical_history.patient.height, "patient.height"
	end

	def patient_weight
		value_of @medical_history.patient.weight, "patient.weight"
	end

	def allergy_cause(an_model)
		value_of an_model.cause, "allergies.cause"
	end

	def allergy_observations(an_model)
		value_of an_model.observations, "allergies.observations"
	end

	def consultation_treatment(a_model)
		value_of a_model.treatment, "consultations.treatment"
	end

	def consultation_symptomps(a_model)
		value_of a_model.symptomps, "consultations.symptomps"
	end

	def consultation_diagnostic(a_model)
		value_of a_model.diagnostic, "consultations.diagnostic"
	end

	def disease_name(a_model)
		value_of a_model.name, "diseases.name"
	end

	def disease_observations(a_model)
		value_of a_model.observations, "diseases.observations"
	end

	def medication_name(a_model)
		value_of a_model.name, "medications.name"
	end

	def medication_dose(a_model)
		value_of a_model.dose, "medications.dose"
	end

	def medication_amount(a_model)
		value_of a_model.amount, "medications.amount"
	end

	def medication_route(a_model)
		value_of a_model.route, "medications.route"
	end

	def exam_name(a_model)
		value_of a_model.name, "medical_exams.name"
	end

	def exam_results(a_model)
		value_of a_model.results, "medical_exams.results"
	end

	def exam_observations(a_model)
		value_of a_model.observations, "medical_exams.observations"
	end


	def value_of(a_value, a_field_name)
		if !@medical_history.highlight.nil? and !@medical_history.highlight[a_field_name].nil?
			highlight = @medical_history.highlight[a_field_name][0]
			if are_equal(highlight,a_value)
				highlight
			else
				a_value
			end
		else
			a_value
		end
	end

	def are_equal(a_highlight, a_value)
		e = remove_highlight(a_highlight)
		puts "e: #{e}"
		e == a_value
	end

	def remove_highlight(a_value)
		copy = a_value.dup
		copy.slice! "<strong class=\"highlight\">"
		copy.slice! "</strong>"
		copy
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(a_medical_history)
		@medical_history = a_medical_history
		@result = ""
	end
end