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

	def self.search(a_text)
		return [] if a_text.empty?
		results = MedicalHistory.search do
			query do
				boolean do
					should {string "patient.firstname:#{a_text}"}
					should {string "patient.lastname:#{a_text}"}
					should {string "patient.birthdate:#{a_text}"}
					should {string "patient.height:#{a_text}"}
					should {string "patient.weight:#{a_text}"}
					should {string "allergies.cause:#{a_text}"}
					should {string "allergies.observations:#{a_text}"}
					should {string "antecedents.description:#{a_text}"}
					should {string "consultations.diagnostic:#{a_text}"}
					should {string "consultations.symptomps:#{a_text}"}
					should {string "consultations.treatment:#{a_text}"}
					should {string "diseases.name:#{a_text}"}
					should {string "diseases.observations:#{a_text}"}
					should {string "medications.name:#{a_text}"}
					should {string "medications.route:#{a_text}"}
					should {string "medications.dose:#{a_text}"}
					should {string "medications.amount:#{a_text}"}
					should {string "vaccines.name:#{a_text}"}
					should {string "medical_exams.name:#{a_text}"}
					should {string "medical_exams.results:#{a_text}"}
					should {string "medical_exams.observations:#{a_text}"}
				end
			end
			highlight "patient.firstname","patient.lastname","patient.birthdate",
								"patient.height","patient.weight",
								"allergies.cause","allergies.observations",
								"antecedents.description",
								"consultations.diagnostic","consultations.symptomps",
								"consultations.treatment",
								"diseases.name","diseases.observations",
								"medications.name","medications.route","medications.dose",
								"medications.amount",
								"vaccines.name",
								"medical_exams.name","medical_exams.results","medical_exams.observations",
								:options => { :tag => "<strong class=\"highlight\">" }
		end
		results.collect { |a_result| MedicalHistorySearchResult.new a_result }
	end
end
