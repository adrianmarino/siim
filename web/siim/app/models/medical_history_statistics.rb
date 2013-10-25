module MedicalHistoryStatistics
	#-------------------------------------------------------------------#
	# Porcentaje de pacientes con "X" sintomas sobre la poblacion total #
	#-------------------------------------------------------------------#
	def self.percentage_of_patient_with_simptomp(a_simptomp)
		patient_count = Patient.count(:dni)
		amount_of_consultations_for_simptomp = Consultation.where("symptomps = ?", a_simptomp).count(:symptomps)

		(((amount_of_consultations_for_simptomp.to_f)/patient_count)*100)
	end

	#------------------------------------------------------------------#
	# Cantidad de pacientes con "X" sintomas para un año en particular #
	#------------------------------------------------------------------#
	def self.amount_of_patients_with_simptomp_on_year(a_simptomp, a_year)
		if a_year.nil? or a_year == 'all'
			Patient.joins('INNER JOIN consultations ON consultations.medical_history_id = patients.medical_history_id').where("consultations.symptomps like concat('%', ?, '%')", a_simptomp).count
		else
			Patient.joins('INNER JOIN consultations ON consultations.medical_history_id = patients.medical_history_id').where("consultations.symptomps like concat('%', ?, '%') AND YEAR(consultations.created_at) = ?", a_simptomp, a_year).count
		end
	end

	#-------------------------------------------------------------------------#
	# Porcentaje de pacientes con una enfermedad "X" sobre la poblacion total #
	#-------------------------------------------------------------------------#
	def self.percentage_of_patient_with_disease(a_disease)
		patient_count = Patient.count(:dni)
		amount_of_consultations_for_disease = Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name like concat('%', ?, '%')",a_disease).count

		(((amount_of_consultations_for_disease.to_f)/patient_count)*100)
	end

	#-----------------------------------------------------------------------#
	# Cantidad de pacientes con una enfermedad "X" para un año en particular#
	#-----------------------------------------------------------------------#
	def self.amount_of_patients_with_disease_on_year(a_disease, a_year)
		if a_year.nil? or a_year == 'all'
			Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name like concat('%', ?, '%')", a_disease).count
		else
			Patient.joins('INNER JOIN diseases ON diseases.medical_history_id = patients.medical_history_id').where("diseases.name like concat('%', ?, '%') AND YEAR(diseases.created_at) = ?", a_disease, a_year).count
		end
	end

	#--------------------------------------------------------------------------#
	# Devuelte tipos de tratamientos utilizados para un sintoma "x" particular #
	#--------------------------------------------------------------------------#
	def self.treatments_used_for(a_simptomp)
		result = Consultation.select(:treatment).where("consultations.symptomps = ?",a_simptomp)
		result.collect {|a_consultation| a_consultation.treatment }
	end
end
