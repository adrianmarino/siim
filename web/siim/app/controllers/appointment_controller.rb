class AppointmentController < ApplicationController
	# -------------------------------------------------------------------------
	# Public Request Methods...
	# -------------------------------------------------------------------------
	def setup_search
		@form = new_form
		render appointments_search_path
	end

	def search
		@form = new_form
		@appointments = Appointment.find specialization: @form.specialization_model,
																					medical: @form.medical_model,
																					patient: @form.patient_model,
																					state: @form.state,
																					from: @form.from_date,
																					to: @form.to_date
		render appointments_search_path
	end

	def liberate
		appointment = request_helper.appointment
		appointment.liberate_and_save if not appointment.nil?
		search
	end

	def reserve
		helper = request_helper
		appointment = helper.appointment
		patient = helper.appointment_patient

		appointment.reserve_and_save(patient) if not appointment.nil?
		search
	end

	def attend
		appointment = request_helper.appointment
		if not appointment.nil?
			appointment.attend_and_save
			redirect_to_medical_history_of appointment
		else
			my_appointments
		end
	end

  def show_medical_history
    appointment = request_helper.appointment
    redirect_to_medical_history_of appointment
  end

	def finalize
		appointment = request_helper.appointment
		appointment.finalize_and_save if not appointment.nil?
		my_appointments
	end

	def my_appointments
		redirect_to(root_path) unless current_user.is_medical?
		@appointments = Appointment.today_of current_user.medical
		render appointments_my_appointments_path
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	def redirect_to_medical_history_of(an_appointment)
		medical_history = medical_history_from an_appointment
		redirect_to edit_medical_history_path(:id => medical_history.id, :back_url => appointments_my_appointments_path)
	end

	def request_helper
		AppointmentRequestHelper.new params
	end

	def new_form
		AppointmentForm.new params
	end

	def medical_history_from(an_appointment)
		MedicalHistory.find_by_patient an_appointment.patient
	end
end