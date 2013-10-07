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

  def my_appointments
    redirect_to(root_path) unless current_user.is_medical?
    @appointments = Appointment.find_today_by_medical current_user.medical
    render appointments_my_appointments_path
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