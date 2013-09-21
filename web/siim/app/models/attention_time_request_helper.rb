module AttentionTimeRequestHelper
	def self.specialization
		specializations = MedicalSpecialization.find params[:specialization]
		specializations.empty? ? nil : specializations.first
	end

	def self.medical
		medicals = Medical.find params[:medical]
		medicals.empty? ? nil : medicals.first
	end

	def self.patient
		patients = Patient.find params[:medical]
		patients.empty? ? nil : patients.first
	end

	def self.attention_time
		attention_times = Patient.find params[:attention_time]
		attention_times.empty? ? nil : attention_times.first
	end

	def self.state
		param[:state]
	end

	def self.from
		param[:from]
	end

	def self.to
		param[:to]
	end
end