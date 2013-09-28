class StatisticController < ApplicationController
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def setup_simptom
		render 'simptoms_statictics'
	end

	def setup_disease
		render 'diseases_statictics'
	end

	def perform_simptom
		simptom = params[:simptom]
		year = params[:year]

		result = Reportes.new.consulta_2 simptom, year

		@valor="Resultado: #{result}"
		logger.info @valor

		render 'simptoms_statictics'
	end

	def perform_disease
		disease = params[:disease]
		year = params[:year]

		result = Reportes.new.consulta_2 disease, year

		@valor="Resultado: #{result}"
		logger.info @valor

		render 'diseases_statictics'
	end

end