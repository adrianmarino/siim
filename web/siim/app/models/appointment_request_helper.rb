class AppointmentRequestHelper
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def specialization
		specialization_param.empty? ? nil : MedicalSpecialization.find(specialization_param)
	end

	def medical
		medical_param.empty? ? nil : Medical.find(medical_param)
  end

	def patient
		patient_param.empty? ? nil : Patient.find(patient_param)
	end

	def from(a_default_value)
		from_param.empty? ? a_default_value : from_param.to_date
	end

	def to(a_default_value)
		to_param.empty? ? a_default_value : to_param.to_date
	end

	def appointment
		appointment_param.empty? ? nil : Appointment.find_by_id(appointment_param)
	end

	def appointment_patient
		appointment_patient_param.empty? ? nil : Patient.find(appointment_patient_param)
	end

	def specialization_param
		param_is_empty?(:specialization) ? EMPTY : @params[:specialization]
	end

	def medical_param
		param_is_empty?(:medical) ? EMPTY : @params[:medical]
	end

	def patient_param
		param_is_empty?(:patient) ? EMPTY : @params[:patient]
	end

	def appointment_patient_param
		param_is_empty?(:appointment_patient) ? EMPTY : @params[:appointment_patient]
	end

	def appointment_param
		param_is_empty?(:appointment) ? EMPTY : @params[:appointment]
	end

	def state_param
		param_is_empty?(:state) ? EMPTY : @params[:state]
	end

	def from_param
		param_is_empty?(:from) ? EMPTY : @params[:from]
	end

	def to_param
		param_is_empty?(:to) ? EMPTY : @params[:to]
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def param_is_empty?(a_param)
		[nil,EMPTY,ALL].include? @params[a_param]
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(params)
		@params = params
	end

	# ----------------------------------------------------------------------------
	# Constants
	# ----------------------------------------------------------------------------
	EMPTY = ""
	ALL = "all"
end