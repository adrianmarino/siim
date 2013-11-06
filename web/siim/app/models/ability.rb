class Ability
	include CanCan::Ability
	# -------------------------------------------------------------------------
	# Initialize...
	# -------------------------------------------------------------------------
	def initialize(an_user)
		define_crud_action

		# Functional Privileges...
		setup_medical_privileges an_user
		setup_appointment_manager_privileges an_user

		# Admin Privileges...
		setup_user_admin_privileges an_user
		setup_system_admin_privileges an_user
		setup_search_engine_admin_privileges an_user
	end

	# -------------------------------------------------------------------------
	# Private Methods...
	# -------------------------------------------------------------------------
	private
	#
	# Setup privileges for each roles...
	#
	def setup_medical_privileges(an_user)
		if an_user.has_role? :medical
			can :search_by_dni, MedicalHistory
			can_search_by_patient_medical_histories
			can_custom_search_medical_histories
			can_read_and_update_complete_medical_history
			can :crud, MedicalHistory

			can_attend_patient
			can :view, :statistic
		end
	end

	def setup_appointment_manager_privileges(an_user)
		if an_user.has_role? :appointment_manager
			can_search_by_patient_medical_histories
			can_read_and_update_only_public_data_of_medical_history
			can_search_appointments
			can_administrate_appointment
		end
	end

	def setup_user_admin_privileges(an_user)
		can :crud, User if an_user.has_role? :user_admin
	end

	def setup_system_admin_privileges(an_user)
		if an_user.has_role? :system_admin
			can :crud, MedicalSpecialization
			can :download, :log
		end
	end

	def setup_search_engine_admin_privileges(an_user)
		if an_user.has_role? :search_engine_admin
			can_custom_search_medical_histories
			can :show_custom_search_result_detail, MedicalHistory
			can :admin, :search_engine
		end
	end

	#
	# Privileges...
	#
	def can_search_by_patient_medical_histories
		can :search_by_patient, :medical_history
	end

	def can_custom_search_medical_histories
		can :custom_search, :medical_history
		can :show_custom_search_result_detail, MedicalHistory
	end

	def can_read_and_update_complete_medical_history
		can :update_private_data, MedicalHistory
		can :update_public_data, MedicalHistory
		can :read_private_data, MedicalHistory
		can :read_public_data, MedicalHistory
	end

	def can_read_and_update_only_public_data_of_medical_history
		can :read, MedicalHistory
		can :update, MedicalHistory
		can :update_public_data, MedicalHistory
		can :read_public_data, MedicalHistory
	end

	def can_search_appointments
		can :setup_search, Appointment
		can :search, Appointment
	end

	def can_attend_patient
		can :attend, Appointment
		can :finalize, Appointment
		can :my_appointments, Appointment
		can :edit_related_medical_history, Appointment
	end

	def can_administrate_appointment
		can :reserve, Appointment
		can :liberate, Appointment
	end

	#
	#  Action alias...
	#
	def define_crud_action
		alias_action :create, :read, :update, :destroy, :to => :crud
	end
end