class StatisticController < ApplicationController
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------

	/Simptmops statictics/
	def setup_simptom
		render 'simptoms_statictics'
	end

	def perform_simptom
		@simptom = params[:simptom]
		@year = params[:year]

		if not @simptom.empty?
			@percentage_of_patient = MedicalHistoryStatistics.percentage_of_patient_with_simptomp @simptom
			@amount_of_patients_on_year = MedicalHistoryStatistics.amount_of_patients_with_simptomp_on_year @simptom, @year
			@treatments_used = MedicalHistoryStatistics.treatments_used_for @simptom
			render 'simptoms_statictics'
		else
			setup_simptom
		end
	end

	/disease statictics/
	def setup_disease
		render 'diseases_statictics'
	end

	def perform_disease
		disease = params[:disease]
		@year = params[:year]

		if not disease.empty?
			@percentage_of_patient = MedicalHistoryStatistics.percentage_of_patient_with_disease disease
			@amount_of_patients_on_year =MedicalHistoryStatistics.amount_of_patients_with_disease_on_year disease, @year
			render 'diseases_statictics'
		else
			setup_disease
		end
	end
end