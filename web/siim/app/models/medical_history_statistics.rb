module MedicalHistoryStatistics
	#-------------------------------------------------------------------#
	# Porcentaje de pacientes con "X" sintomas sobre la poblacion total #
	#-------------------------------------------------------------------#
	def self.percentage_of_patient_with_simptomp(a_simptomp, a_year)
		patient_count = Patient.count(:dni)

		if a_year.nil? or a_year == 'all'
			amount_of_consultations_for_simptomp = Consultation.where("symptomps LIKE concat('%', ?, '%')", a_simptomp).count(:symptomps)
		else
			amount_of_consultations_for_simptomp = Consultation.where("symptomps LIKE concat('%', ?, '%') AND YEAR(achievement_date) = ?", a_simptomp, a_year).count(:symptomps)
		end

		(((amount_of_consultations_for_simptomp.to_f)/patient_count)*100)
	end

	#------------------------------------------------------------------#
	# Cantidad de pacientes con "X" sintomas para un año en particular #
	#------------------------------------------------------------------#
	def self.amount_of_patients_with_simptomp_on_year(a_simptomp, a_year)
		if a_year.nil? or a_year == 'all'
			Patient.joins('INNER JOIN consultations ON consultations.medical_history_id = patients.medical_history_id').where("consultations.symptomps LIKE concat('%', ?, '%')", a_simptomp).count
		else
			Patient.joins('INNER JOIN consultations ON consultations.medical_history_id = patients.medical_history_id').where("consultations.symptomps LIKE concat('%', ?, '%') AND YEAR(consultations.achievement_date) = ?", a_simptomp, a_year).count
		end
	end

	#-------------------------------------------------------------------------#
	# Porcentaje de pacientes con una enfermedad "X" sobre la poblacion total #
	#-------------------------------------------------------------------------#
	def self.percentage_of_patient_with_disease(a_disease,  a_year)
		patient_count = Patient.count(:dni)

		if a_year.nil? or a_year == 'all'
			amount_of_consultations_for_disease = Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name LIKE concat('%', ?, '%')",a_disease).count
		else
			amount_of_consultations_for_disease = Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name LIKE concat('%', ?, '%') AND YEAR(diseases.record_date) = ?",a_disease, a_year).count
		end

		(((amount_of_consultations_for_disease.to_f)/patient_count)*100)
	end

	#-----------------------------------------------------------------------#
	# Cantidad de pacientes con una enfermedad "X" para un año en particular#
	#-----------------------------------------------------------------------#
	def self.amount_of_patients_with_disease_on_year(a_disease, a_year)
		if a_year.nil? or a_year == 'all'
			Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name LIKE concat('%', ?, '%')", a_disease).count
		else
			Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name LIKE concat('%', ?, '%') AND YEAR(diseases.record_date) = ?", a_disease, a_year).count
		end
	end
end
