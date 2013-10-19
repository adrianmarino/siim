module MedicalHistorySearchEngine
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def self.delete_indexes
		Tire.index(:medical_histories).delete
	end

	def self.refresh_indexes
		MedicalHistory.tire.index.refresh
	end

	def self.raw_search(a_text)
		return [] if a_text.empty?
		results = MedicalHistory.search do
			query do
				boolean do
					# Patient
					should {string "patient.firstname.partial:#{a_text}"}
					should {string "patient.firstname.partial_back:#{a_text}"}
					should {string "patient.firstname.partial_middle:#{a_text}"}
					should {string "patient.firstname.title:#{a_text}"}

					should {string "patient.lastname.partial:#{a_text}"}
					should {string "patient.lastname.partial_back:#{a_text}"}
					should {string "patient.lastname.partial_middle:#{a_text}"}
					should {string "patient.lastname.title:#{a_text}"}

					should {string "patient.birthdate.partial:#{a_text}"}
					should {string "patient.birthdate.partial_back:#{a_text}"}
					should {string "patient.birthdate.partial_middle:#{a_text}"}
					should {string "patient.birthdate.title:#{a_text}"}

					should {string "patient.height.partial:#{a_text}"}
					should {string "patient.height.partial_back:#{a_text}"}
					should {string "patient.height.partial_middle:#{a_text}"}
					should {string "patient.height.title:#{a_text}"}

					should {string "patient.weight.partial:#{a_text}"}
					should {string "patient.weight.partial_back:#{a_text}"}
					should {string "patient.weight.partial_middle:#{a_text}"}
					should {string "patient.weight.title:#{a_text}"}

					# Allergies...
					should {string "allergies.cause.partial:#{a_text}"}
					should {string "allergies.cause.partial_back:#{a_text}"}
					should {string "allergies.cause.partial_middle:#{a_text}"}
					should {string "allergies.cause.title:#{a_text}"}

					should {string "allergies.observations.partial:#{a_text}"}
					should {string "allergies.observations.partial_back:#{a_text}"}
					should {string "allergies.observations.partial_middle:#{a_text}"}
					should {string "allergies.observations.title:#{a_text}"}

					# Antecedents...
					should {string "antecedents.description.partial:#{a_text}"}
					should {string "antecedents.description.partial_back:#{a_text}"}
					should {string "antecedents.description.partial_middle:#{a_text}"}
					should {string "antecedents.description.title:#{a_text}"}

					# Consultations...
					should {string "consultations.diagnostic.partial:#{a_text}"}
					should {string "consultations.diagnostic.partial_back:#{a_text}"}
					should {string "consultations.diagnostic.partial_middle:#{a_text}"}
					should {string "consultations.diagnostic.title:#{a_text}"}

					should {string "consultations.symptomps.partial:#{a_text}"}
					should {string "consultations.symptomps.partial_back:#{a_text}"}
					should {string "consultations.symptomps.partial_middle:#{a_text}"}
					should {string "consultations.symptomps.title:#{a_text}"}

					should {string "consultations.treatment.partial:#{a_text}"}
					should {string "consultations.treatment.partial_back:#{a_text}"}
					should {string "consultations.treatment.partial_middle:#{a_text}"}
					should {string "consultations.treatment.title:#{a_text}"}

					# Diaseases...
					should {string "diseases.name.partial:#{a_text}"}
					should {string "diseases.name.partial_back:#{a_text}"}
					should {string "diseases.name.partial_middle:#{a_text}"}
					should {string "diseases.name.title:#{a_text}"}

					should {string "diseases.observations.partial:#{a_text}"}
					should {string "diseases.observations.partial_back:#{a_text}"}
					should {string "diseases.observations.partial_middle:#{a_text}"}
					should {string "diseases.observations.title:#{a_text}"}

					# Medications...
					should {string "medications.name.partial:#{a_text}"}
					should {string "medications.name.partial_back:#{a_text}"}
					should {string "medications.name.partial_middle:#{a_text}"}
					should {string "medications.name.title:#{a_text}"}

					should {string "medications.route.partial:#{a_text}"}
					should {string "medications.route.partial_back:#{a_text}"}
					should {string "medications.route.partial_middle:#{a_text}"}
					should {string "medications.route.title:#{a_text}"}

					should {string "medications.dose.partial:#{a_text}"}
					should {string "medications.dose.partial_back:#{a_text}"}
					should {string "medications.dose.partial_middle:#{a_text}"}
					should {string "medications.dose.title:#{a_text}"}

					should {string "medications.amount.partial:#{a_text}"}
					should {string "medications.amount.partial_back:#{a_text}"}
					should {string "medications.amount.partial_middle:#{a_text}"}
					should {string "medications.amount.title:#{a_text}"}

					# Vaccines...
					should {string "vaccines.name.partial:#{a_text}"}
					should {string "vaccines.name.partial_back:#{a_text}"}
					should {string "vaccines.name.partial_middle:#{a_text}"}
					should {string "vaccines.name.title:#{a_text}"}

					# Exams...
					should {string "medical_exams.name.partial:#{a_text}"}
					should {string "medical_exams.name.partial_back:#{a_text}"}
					should {string "medical_exams.name.partial_middle:#{a_text}"}
					should {string "medical_exams.name.title:#{a_text}"}

					should {string "medical_exams.results.partial:#{a_text}"}
					should {string "medical_exams.results.partial_back:#{a_text}"}
					should {string "medical_exams.results.partial_middle:#{a_text}"}
					should {string "medical_exams.results.title:#{a_text}"}

					should {string "medical_exams.observations.partial:#{a_text}"}
					should {string "medical_exams.observations.partial_back:#{a_text}"}
					should {string "medical_exams.observations.partial_middle:#{a_text}"}
					should {string "medical_exams.observations.title:#{a_text}"}
				end
			end
			highlight "patient.firstname.partial",
								"patient.firstname.partial_back",
								"patient.firstname.partial_middle",
								"patient.firstname.title",

								"patient.lastname.partial",
								"patient.lastname.partial_back",
								"patient.lastname.partial_middle",
								"patient.lastname.title",

								"patient.birthdate.partial",
								"patient.birthdate.partial_back",
								"patient.birthdate.partial_middle",
								"patient.birthdate.title",

								"patient.height.partial",
								"patient.height.partial_back",
								"patient.height.partial_middle",
								"patient.height.title",

								"patient.weight.partial",
								"patient.weight.partial_back",
								"patient.weight.partial_middle",
								"patient.weight.title",



								"allergies.cause.partial",
								"allergies.cause.partial_back",
								"allergies.cause.partial_middle",
								"allergies.cause.title",

								"allergies.observations.partial",
								"allergies.observations.partial_back",
								"allergies.observations.partial_middle",
								"allergies.observations.title",



								"antecedents.description.partial",
								"antecedents.description.partial_back",
								"antecedents.description.partial_middle",
								"antecedents.description.title",



								"consultations.diagnostic.partial",
								"consultations.diagnostic.partial_back",
								"consultations.diagnostic.partial_middle",
								"consultations.diagnostic.title",

								"consultations.symptomps.partial",
								"consultations.symptomps.partial_back",
								"consultations.symptomps.partial_middle",
								"consultations.symptomps.title",

								"consultations.treatment.partial",
								"consultations.treatment.partial_back",
								"consultations.treatment.partial_middle",
								"consultations.treatment.title",



								"diseases.name.partial",
								"diseases.name.partial_back",
								"diseases.name.partial_middle",
								"diseases.name.title",

								"diseases.observations.partial",
								"diseases.observations.partial_back",
								"diseases.observations.partial_middle",
								"diseases.observations.title",



								"medications.name.partial",
								"medications.name.partial_back",
								"medications.name.partial_middle",
								"medications.name.title",

								"medications.route.partial",
								"medications.route.partial_back",
								"medications.route.partial_middle",
								"medications.route.title",

								"medications.dose.partial",
								"medications.dose.partial_back",
								"medications.dose.partial_middle",
								"medications.dose.title",

								"medications.amount.partial",
								"medications.amount.partial_back",
								"medications.amount.partial_middle",
								"medications.amount.title",



								"vaccines.name.partial",
								"vaccines.name.partial_back",
								"vaccines.name.partial_middle",
								"vaccines.name.title",



								"medical_exams.name.partial",
								"medical_exams.name.partial_back",
								"medical_exams.name.partial_middle",
								"medical_exams.name.title",

								"medical_exams.results.partial",
								"medical_exams.results.partial_back",
								"medical_exams.results.partial_middle",
								"medical_exams.results.title",

								"medical_exams.observations.partial",
								"medical_exams.observations.partial_back",
								"medical_exams.observations.partial_middle",
								"medical_exams.observations.title",

								:options => { :tag => APP_CONFIG['search']['highlight']['begin'] }
		end
	end

	def self.search(a_text)
		raw_search(a_text).collect { |a_result| MedicalHistorySearchResult.new a_result }
	end
end
