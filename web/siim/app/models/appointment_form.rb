class AppointmentForm
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def fields
		fields = {}
		fields[:specialization ] = @specialization unless is_empty?(@specialization)
		fields[:medical] = @medical unless is_empty?(@medical)
		fields[:patient] = @patient unless is_empty?(@patient)
		fields[:state] = @state  unless is_empty?(@state)
		fields[:from] = @from  unless is_empty?(@from)
		fields[:to] = @to  unless is_empty?(@to)
		fields
	end

	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessor :specializations, :specialization, :specialization_model,
		:medicals, :medical, :medical_model,
		:patients, :patient, :patient_model,
		:states, :state,
		:from, :from_date,
		:to, :to_date

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def request_helper(params)
		AppointmentRequestHelper.new params
	end

	def is_empty?(a_value)
		[nil,""].include? a_value
	end

	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(params)
		@specializations = MedicalSpecialization.all
		@medicals = Medical.all
		@patients = Patient.order("firstname, lastname ASC")
		@states = Appointment.all_states

		helper = request_helper params
		@specialization = helper.specialization_param
		@medical = helper.medical_param
		@patient = helper.patient_param
		@state = helper.state_param
		@from = helper.from(Date.today.at_midnight).strftime("%Y-%m-%d")
		@to = helper.to(Appointment.last.to_date.at_midnight).strftime("%Y-%m-%d")

		@specialization_model = helper.specialization
		@medical_model = helper.medical
		@patient_model = helper.patient
		@from_date = helper.from(Date.today)
		@to_date = helper.to(Appointment.last.to_date)
	end
end