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
					should {string "patient.birthdate.title:#{search_string}"}
					should {string "patient.birthdate.partial_middle:#{search_string}"}
					should {string "patient.birthdate.partial_back:#{search_string}"}
					should {string "patient.birthdate.partial:#{search_string}"}

					should {string "patient.height.title:#{search_string}"}
					should {string "patient.height.partial_middle:#{search_string}"}
					should {string "patient.height.partial_back:#{search_string}"}
					should {string "patient.height.partial:#{search_string}"}

					should {string "patient.weight.title:#{search_string}"}
					should {string "patient.weight.partial_middle:#{search_string}"}
					should {string "patient.weight.partial_back:#{search_string}"}
					should {string "patient.weight.partial:#{search_string}"}

					# Allergies...
					should {string "allergies.cause.title:#{search_string}"}
					should {string "allergies.cause.partial_middle:#{search_string}"}
					should {string "allergies.cause.partial_back:#{search_string}"}
					should {string "allergies.cause.partial:#{search_string}"}

					should {string "allergies.observations.title:#{search_string}"}
					should {string "allergies.observations.partial_middle:#{search_string}"}
					should {string "allergies.observations.partial_back:#{search_string}"}
					should {string "allergies.observations.partial:#{search_string}"}

					# Antecedents...
					should {string "antecedents.description.title:#{search_string}"}
					should {string "antecedents.description.partial_middle:#{search_string}"}
					should {string "antecedents.description.partial_back:#{search_string}"}
					should {string "antecedents.description.partial:#{search_string}"}

					# Consultations...
					should {string "consultations.diagnostic.title:#{search_string}"}
					should {string "consultations.diagnostic.partial_middle:#{search_string}"}
					should {string "consultations.diagnostic.partial_back:#{search_string}"}
					should {string "consultations.diagnostic.partial:#{search_string}"}

					should {string "consultations.symptomps.title:#{search_string}"}
					should {string "consultations.symptomps.partial_middle:#{search_string}"}
					should {string "consultations.symptomps.partial_back:#{search_string}"}
					should {string "consultations.symptomps.partial:#{search_string}"}

					should {string "consultations.treatment.title:#{search_string}"}
					should {string "consultations.treatment.partial_middle:#{search_string}"}
					should {string "consultations.treatment.partial_back:#{search_string}"}
					should {string "consultations.treatment.partial:#{search_string}"}

					# Diaseases...
					should {string "diseases.name.title:#{search_string}"}
					should {string "diseases.name.partial_middle:#{search_string}"}
					should {string "diseases.name.partial_back:#{search_string}"}
					should {string "diseases.name.partial:#{search_string}"}

					should {string "diseases.observations.title:#{search_string}"}
					should {string "diseases.observations.partial_middle:#{search_string}"}
					should {string "diseases.observations.partial_back:#{search_string}"}
					should {string "diseases.observations.partial:#{search_string}"}

					# Medications...
					should {string "medications.name.title:#{search_string}"}
					should {string "medications.name.partial_middle:#{search_string}"}
					should {string "medications.name.partial_back:#{search_string}"}
					should {string "medications.name.partial:#{search_string}"}

					should {string "medications.route.title:#{search_string}"}
					should {string "medications.route.partial_middle:#{search_string}"}
					should {string "medications.route.partial_back:#{search_string}"}
					should {string "medications.route.partial:#{search_string}"}

					should {string "medications.dose.title:#{search_string}"}
					should {string "medications.dose.partial_middle:#{search_string}"}
					should {string "medications.dose.partial_back:#{search_string}"}
					should {string "medications.dose.partial:#{search_string}"}

					should {string "medications.amount.title:#{search_string}"}
					should {string "medications.amount.partial_middle:#{search_string}"}
					should {string "medications.amount.partial_back:#{search_string}"}
					should {string "medications.amount.partial:#{search_string}"}

					# Vaccines...
					should {string "vaccines.name.title:#{search_string}"}
					should {string "vaccines.name.partial_middle:#{search_string}"}
					should {string "vaccines.name.partial_back:#{search_string}"}
					should {string "vaccines.name.partial:#{search_string}"}

					# Exams...
					should {string "medical_exams.name.title:#{search_string}"}
					should {string "medical_exams.name.partial_middle:#{search_string}"}
					should {string "medical_exams.name.partial_back:#{search_string}"}
					should {string "medical_exams.name.partial:#{search_string}"}

					should {string "medical_exams.results.title:#{search_string}"}
					should {string "medical_exams.results.partial_middle:#{search_string}"}
					should {string "medical_exams.results.partial_back:#{search_string}"}
					should {string "medical_exams.results.partial:#{search_string}"}

					should {string "medical_exams.observations.title:#{search_string}"}
					should {string "medical_exams.observations.partial_middle:#{search_string}"}
					should {string "medical_exams.observations.partial_back:#{search_string}"}
					should {string "medical_exams.observations.partial:#{search_string}"}
				end
			end
			highlight	"patient.birthdate.title",
								"patient.birthdate.partial_middle",
								"patient.birthdate.partial_back",

								"patient.height.title",
								"patient.height.partial_middle",
								"patient.height.partial_back",

								"patient.weight.title",
								"patient.weight.partial_middle",
								"patient.weight.partial_back",



								"allergies.cause.title",
								"allergies.cause.partial_middle",
								"allergies.cause.partial_back",

								"allergies.observations.title",
								"allergies.observations.partial_middle",
								"allergies.observations.partial_back",



								"antecedents.description.title",
								"antecedents.description.partial_middle",
								"antecedents.description.partial_back",



								"consultations.diagnostic.title",
								"consultations.diagnostic.partial_middle",
								"consultations.diagnostic.partial_back",

								"consultations.symptomps.title",
								"consultations.symptomps.partial_middle",
								"consultations.symptomps.partial_back",

								"consultations.treatment.title",
								"consultations.treatment.partial_middle",
								"consultations.treatment.partial_back",



								"diseases.name.title",
								"diseases.name.partial_middle",
								"diseases.name.partial_back",

								"diseases.observations.title",
								"diseases.observations.partial_middle",
								"diseases.observations.partial_back",



								"medications.name.title",
								"medications.name.partial_middle",
								"medications.name.partial_back",

								"medications.route.title",
								"medications.route.partial_middle",
								"medications.route.partial_back",

								"medications.dose.title",
								"medications.dose.partial_middle",
								"medications.dose.partial_back",

								"medications.amount.title",
								"medications.amount.partial_middle",
								"medications.amount.partial_back",



								"vaccines.name.title",
								"vaccines.name.partial_middle",
								"vaccines.name.partial_back",


								"medical_exams.name.title",
								"medical_exams.name.partial_middle",
								"medical_exams.name.partial_back",

								"medical_exams.results.title",
								"medical_exams.results.partial_middle",
								"medical_exams.results.partial_back",

								"medical_exams.observations.title",
								"medical_exams.observations.partial_middle",
								"medical_exams.observations.partial_back",

								:options => { :tag => APP_CONFIG.highlight_begin }
		end
	end

	def self.search(a_search_string)
		raw_search(a_search_string).collect do |a_result|
			SearchResult.new	entity: MedicalHistory.find(a_result.id), 
												result: a_result,
												separator: RESULT_VALUE_SEPATATOR,
												begin_tag: APP_CONFIG.highlight_begin,
												end_tag:APP_CONFIG.highlight_end
		end
	end
	# ----------------------------------------------------------------------------
	# Constants
	# ----------------------------------------------------------------------------
	RESULT_VALUE_SEPATATOR = "..."
end
