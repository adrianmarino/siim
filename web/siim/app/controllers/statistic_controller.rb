class StatisticController < ApplicationController
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	/Simptmops statictics/
	def setup_simptom
		authorize! :view, :statistic
		@years = Consultation.all_achievement_years
		render 'simptoms_statictics'
	end

	def perform_simptom
		authorize! :view, :statistic
		@simptom = params[:simptom]
		@year = params[:year]

		if @simptom.size >= 3
			@percentage_of_patient = MedicalHistoryStatistics.percentage_of_patient_with_simptomp @simptom, @year
			@amount_of_patients_on_year = MedicalHistoryStatistics.amount_of_patients_with_simptomp_on_year @simptom, @year
			@years = Consultation.all_achievement_years
			render 'simptoms_statictics'
		else
			flash[:alert] = t "statistics.simptomp.empty_simptomp"
			setup_simptom
		end
	end

	/disease statictics/
	def setup_disease
		authorize! :view, :statistic
		@years = Disease.all_record_years
		render 'diseases_statictics'
	end

	def perform_disease
		authorize! :view, :statistic
		disease = params[:disease]
		@year = params[:year]

		if disease.size >= 3
			@percentage_of_patient = MedicalHistoryStatistics.percentage_of_patient_with_disease disease, @year
			@amount_of_patients_on_year =MedicalHistoryStatistics.amount_of_patients_with_disease_on_year disease, @year
			@years = Disease.all_record_years
			render 'diseases_statictics'
		else
			flash[:alert] = t "statistics.disease.empty_disease"
			setup_disease
		end
	end
end