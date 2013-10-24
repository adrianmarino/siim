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
		search_string = SearchEngineHelper.sanitize a_text
		return [] if search_string.empty?

		results = MedicalHistory.search do
			query do
				boolean do
					# Patient
					should {string "patient.firstname.partial:#{search_string}"}
					should {string "patient.firstname.partial_back:#{search_string}"}
					should {string "patient.firstname.partial_middle:#{search_string}"}
					should {string "patient.firstname.title:#{search_string}"}

					should {string "patient.lastname.partial:#{search_string}"}
					should {string "patient.lastname.partial_back:#{search_string}"}
					should {string "patient.lastname.partial_middle:#{search_string}"}
					should {string "patient.lastname.title:#{search_string}"}

					should {string "patient.birthdate.partial:#{search_string}"}
					should {string "patient.birthdate.partial_back:#{search_string}"}
					should {string "patient.birthdate.partial_middle:#{search_string}"}
					should {string "patient.birthdate.title:#{search_string}"}

					should {string "patient.height.partial:#{search_string}"}
					should {string "patient.height.partial_back:#{search_string}"}
					should {string "patient.height.partial_middle:#{search_string}"}
					should {string "patient.height.title:#{search_string}"}

					should {string "patient.weight.partial:#{search_string}"}
					should {string "patient.weight.partial_back:#{search_string}"}
					should {string "patient.weight.partial_middle:#{search_string}"}
					should {string "patient.weight.title:#{search_string}"}

					# Allergies...
					should {string "allergies.cause.partial:#{search_string}"}
					should {string "allergies.cause.partial_back:#{search_string}"}
					should {string "allergies.cause.partial_middle:#{search_string}"}
					should {string "allergies.cause.title:#{search_string}"}

					should {string "allergies.observations.partial:#{search_string}"}
					should {string "allergies.observations.partial_back:#{search_string}"}
					should {string "allergies.observations.partial_middle:#{search_string}"}
					should {string "allergies.observations.title:#{search_string}"}

					# Antecedents...
					should {string "antecedents.description.partial:#{search_string}"}
					should {string "antecedents.description.partial_back:#{search_string}"}
					should {string "antecedents.description.partial_middle:#{search_string}"}
					should {string "antecedents.description.title:#{search_string}"}

					# Consultations...
					should {string "consultations.diagnostic.partial:#{search_string}"}
					should {string "consultations.diagnostic.partial_back:#{search_string}"}
					should {string "consultations.diagnostic.partial_middle:#{search_string}"}
					should {string "consultations.diagnostic.title:#{search_string}"}

					should {string "consultations.symptomps.partial:#{search_string}"}
					should {string "consultations.symptomps.partial_back:#{search_string}"}
					should {string "consultations.symptomps.partial_middle:#{search_string}"}
					should {string "consultations.symptomps.title:#{search_string}"}

					should {string "consultations.treatment.partial:#{search_string}"}
					should {string "consultations.treatment.partial_back:#{search_string}"}
					should {string "consultations.treatment.partial_middle:#{search_string}"}
					should {string "consultations.treatment.title:#{search_string}"}

					# Diaseases...
					should {string "diseases.name.partial:#{search_string}"}
					should {string "diseases.name.partial_back:#{search_string}"}
					should {string "diseases.name.partial_middle:#{search_string}"}
					should {string "diseases.name.title:#{search_string}"}

					should {string "diseases.observations.partial:#{search_string}"}
					should {string "diseases.observations.partial_back:#{search_string}"}
					should {string "diseases.observations.partial_middle:#{search_string}"}
					should {string "diseases.observations.title:#{search_string}"}

					# Medications...
					should {string "medications.name.partial:#{search_string}"}
					should {string "medications.name.partial_back:#{search_string}"}
					should {string "medications.name.partial_middle:#{search_string}"}
					should {string "medications.name.title:#{search_string}"}

					should {string "medications.route.partial:#{search_string}"}
					should {string "medications.route.partial_back:#{search_string}"}
					should {string "medications.route.partial_middle:#{search_string}"}
					should {string "medications.route.title:#{search_string}"}

					should {string "medications.dose.partial:#{search_string}"}
					should {string "medications.dose.partial_back:#{search_string}"}
					should {string "medications.dose.partial_middle:#{search_string}"}
					should {string "medications.dose.title:#{search_string}"}

					should {string "medications.amount.partial:#{search_string}"}
					should {string "medications.amount.partial_back:#{search_string}"}
					should {string "medications.amount.partial_middle:#{search_string}"}
					should {string "medications.amount.title:#{search_string}"}

					# Vaccines...
					should {string "vaccines.name.partial:#{search_string}"}
					should {string "vaccines.name.partial_back:#{search_string}"}
					should {string "vaccines.name.partial_middle:#{search_string}"}
					should {string "vaccines.name.title:#{search_string}"}

					# Exams...
					should {string "medical_exams.name.partial:#{search_string}"}
					should {string "medical_exams.name.partial_back:#{search_string}"}
					should {string "medical_exams.name.partial_middle:#{search_string}"}
					should {string "medical_exams.name.title:#{search_string}"}

					should {string "medical_exams.results.partial:#{search_string}"}
					should {string "medical_exams.results.partial_back:#{search_string}"}
					should {string "medical_exams.results.partial_middle:#{search_string}"}
					should {string "medical_exams.results.title:#{search_string}"}

					should {string "medical_exams.observations.partial:#{search_string}"}
					should {string "medical_exams.observations.partial_back:#{search_string}"}
					should {string "medical_exams.observations.partial_middle:#{search_string}"}
					should {string "medical_exams.observations.title:#{search_string}"}
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

								:options => { :tag => APP_CONFIG.highlight_begin }
		end
	end

	def self.search(a_search_string)
		raw_search(a_search_string).collect { |a_result| MedicalHistorySearchResult.new a_result }
	end
end
