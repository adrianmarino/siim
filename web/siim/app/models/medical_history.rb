class MedicalHistory < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks
	#
	#
	#
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	after_save do
		puts "UPDATE INDEX..."
		update_index
	end

	def initialize_with_associations
		a_patient = Patient.new
		a_patient.medical_history = self
		self.patient = a_patient
	end

	def as_json(options={})
		super(
			only:[:id],
			include:{
				patient:				{only:[:dni,:firstname,:lastname,:birthdate,:blood_type,
																:height,:weight,:sex,:address,:email,:home_phone,
																:movile_phone]},
				allergies:			{only:[:cause,:observations]},
				antecedents:		{only:[:description]},
				consultations:	{only:[:diagnostic,:symptomps,:treatment]},
				diseases:				{only:[:name,:observations]},
				medications:		{only:[:name,:dose,:amount,:route]},
				vaccines:				{only:[:last_application,:name]},
				medical_exams:	{only:[:achievement_date,:name,:results,:observations]}
			}
		)
	end

	def to_indexed_json
		to_json
	end

	#
	#
	#
	# -------------------------------------------------------------------------
	# Public Class Methods...
	# -------------------------------------------------------------------------
	def self.find_by_dni(a_dni)
		MedicalHistory.includes(:patient).where("patients.dni=?",a_dni).first
	end

	def self.find_by_patient(a_patient)
		MedicalHistory.includes(:patient).where("patients.id=?",a_patient.id)
	end

	def self.find_by_firname_and_lastname(a_first_name, a_last_name)
		MedicalHistory.includes(:patient).where("patients.firstname LIKE concat('%', ?, '%') AND patients.lastname LIKE concat('%', ?, '%')", a_first_name, a_last_name)
	end
	#
	# -------------------------------------------------------------------------
	# Attributes...
	# -------------------------------------------------------------------------
	attr_accessible :id, :allergies, :antecedents, :consultations, :diseases,
		:medical_exams, :medications, :vaccines, :patient, :allergies_attributes,
		:antecedents_attributes, :consultations_attributes, :diseases_attributes,
		:medical_exams_attributes, :medications_attributes, :vaccines_attributes,
		:patient_attributes, :_destroy

	attr_accessor :_destroy
	#
	#
	#
	# -------------------------------------------------------------------------
	# Associations...
	# -------------------------------------------------------------------------
	has_many	:allergies, dependent: :delete_all
	has_many	:antecedents, dependent: :delete_all
	has_many	:consultations, dependent: :delete_all
	has_many	:diseases, dependent: :delete_all
	has_many	:medical_exams, dependent: :delete_all
	has_many	:medications, dependent: :delete_all
	has_many	:vaccines, dependent: :delete_all
	has_one		:patient, dependent: :delete
	#
	#
	#
	# -------------------------------------------------------------------------
	# Nested attributes...
	# -------------------------------------------------------------------------
	accepts_nested_attributes_for :allergies, allow_destroy: true
	accepts_nested_attributes_for :antecedents, allow_destroy: true
	accepts_nested_attributes_for :consultations, allow_destroy: true
	accepts_nested_attributes_for :diseases, allow_destroy: true
	accepts_nested_attributes_for :medical_exams, allow_destroy: true
	accepts_nested_attributes_for :medications, allow_destroy: true
	accepts_nested_attributes_for :vaccines, allow_destroy: true
	accepts_nested_attributes_for :patient, allow_destroy: true
	#
	#
	#
	# -------------------------------------------------------------------------
	# Search Settings...
	# -------------------------------------------------------------------------
	# Enable automatic saving in elasticsearch when associated objects change...
	after_touch() { tire.update_index }

	# Properly serialize JSON for elasticsearch...
	self.include_root_in_json = false

	settings	number_of_shards: 1,
						number_of_replicas: 1,
						analysis:{
							filter:{
								spanish_stop:{
									'type'					 => 'stop',
									'stopwords_path' => 'spanish_stop_words.txt'
								},
								name_ngrams:{
									'type'			=> 'edgeNGram',
									'side'			=> 'front',
									'max_gram'	=> 50,
									'min_gram'	=> 2
								},
								name_ngrams_back:{
									 'side'		 => 'back',
									 'max_gram' => 50,
									 'min_gram' => 2,
									 'type'		 => 'edgeNGram'
								},
								name_middle_ngrams:{
									 'type'		 => 'nGram',
									 'max_gram' => 50,
									 'min_gram' => 2
								}
							},
							analyzer:{
								full_name:{
									'filter'		=> [ 'standard', 'lowercase','asciifolding','spanish_stop'],
									'type'			=> 'custom',
									'tokenizer' => 'standard'
								},
								partial_name:{
									'type'			=> 'custom',
									'tokenizer' => 'standard',
									'filter'		=> ['standard','lowercase','asciifolding','name_ngrams','spanish_stop']		 
								},
								partial_name_back:{
									'type'			 => 'custom',
									'tokenizer'	=> 'standard',
									'filter'		 => ['standard','lowercase','asciifolding','name_ngrams_back','spanish_stop']
								},
								partial_middle_name:{
									'type' =>'custom',
									'tokenizer' => 'standard',
									'filter' => ['standard','lowercase','asciifolding','name_middle_ngrams','spanish_stop']
							}
						}
		} do
			mapping do
				indexes :patient do
					indexes :firstname,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :lastname,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :birthdate,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :height,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :weight,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end

				indexes :allergies do
					indexes :cause,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :observations,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end


				indexes :antecedents do
					indexes :description,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end


				indexes :consultations do
					indexes :diagnostic,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :symptomps,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :treatment,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end


				indexes :diseases do
					indexes :name,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :observations,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end


				indexes :medications do
					indexes :name,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :route,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :dose,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :amount,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end


				indexes :vaccines do
					indexes :name,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end

				indexes :medical_exams do
					indexes :name,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :results,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
					indexes :observations,
									type: 'multi_field',
									fields:{
											"partial"				=>{ type:"string",search_analyzer:"full_name",index_analyzer:"partial_name"},
											"partial_back"	=>{type: "string",index_analyzer:"partial_name_back",search_analyzer:"full_name"},
											"partial_middle"=>{type:"string",index_analyzer:"partial_middle_name",search_analyzer:"full_name"},
											"title"					=>{type:"string", analyzer: "full_name"}
									}
				end
			end
		end
end