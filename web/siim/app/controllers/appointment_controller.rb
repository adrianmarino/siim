class AppointmentController < ApplicationController
	# -------------------------------------------------------------------------
	# Public Request Methods...
	# -------------------------------------------------------------------------
	def setup_search
		@form = new_form
		render appointments_setup_search_path
	end

	def search
		@form = new_form
		@appointments = Appointment.find specialization: @form.specialization_model,
																					medical: @form.medical_model,
																					patient: @form.patient_model,
																					state: @form.state,
																					from: @form.from_date,
																					to: @form.to_date
		render appointments_setup_search_path
	end

	def liberate
		appointment = request_helper.appointment

		if not appointment.nil?
			appointment.liberate!
			appointment.save
		end

		search
	end

	def reserve
		helper = request_helper
		appointment = helper.appointment

		if not appointment.nil?
			appointment.reserve!
			appointment.patient = helper.appointment_patient
			appointment.save
		end
		search
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def request_helper
		AppointmentRequestHelper.new params
	end

	def new_form
		AppointmentForm.new params
	end
end