class MedicalHistory < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks
	#
	#
	#
	# -------------------------------------------------------------------------
	# Public Methods...
	# -------------------------------------------------------------------------
	def initialize_with_associations
		a_patient = Patient.new
		a_patient.medical_history = self
		self.patient = a_patient
	end

	def as_json(options={})
		super(
			:only => [:id],
			:include =>	{
				:patient => { :only => [:dni, :firstname, :lastname, :birthdate, :blood_type,
																:height, :weight, :sex, :address, :email, :home_phone, :movile_phone] 
										},
				:allergies => {:only =>[:cause]},
				:antecedents => { :only => [:description]},
				:consultations => {:only=>[:diagnostic]},
				:diseases => {:only =>[:name]},
				:medications => {:only => [:name,:dose,:how_often]},
				:vaccines => {:only => [:last_application, :name]},
				:medical_exams => {:only => [:achievement_date, :name]}
			}
		)
	end

	def to_indexed_json
		to_json( include: {
				:patient => { :only => [
					:dni, :firstname, :lastname, :birthdate, :blood_type, :height, :weight, :sex, 
					:address, :email, :home_phone, :movile_phone
				]},
				:allergies => {:only =>[:cause]},
				:antecedents => { :only => [:description]},
				:consultations => {:only=>[:diagnostic]},
				:diseases => {:only =>[:name]},
				:medications => {:only => [:name,:dose,:how_often]},
				:vaccines => {:only => [:last_application, :name]},
				:medical_exams => {:only => [:achievement_date, :name]}
			}
		)
	end

	def self.custom_search(a_text)
		query = lambda do |should|
			should.string a_text
		end
		search = Tire.search :medical_histories do
			query do
				boolean do
					should &query
				end
			end
			highlight "firstname", :options => { :tag => '<strong class="highlight">' }
		end
		result = search.results.each_with_hit do |result, hit|
			puts "#{result.title} (score: #{hit['_score']})"
		end
		result
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
		MedicalHistory.includes(:patient).where("patients.id=?",a_patient.id).first
	end
	#
	#
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
	has_one	 :patient, dependent: :delete
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

	settings :number_of_shards => 1,
					 :number_of_replicas => 1,
					 :analysis => {
						 :filter => {
								:spanish_stop	=> {
									'type'					 => 'stop',
									'stopwords_path' => 'spanish_stop_words.txt'
								},
								:name_ngrams => {
									'type'			=> 'edgeNGram',
									'side'			=> 'front',
									'max_gram'	=> 50,
									'min_gram'	=> 2
								},
								:name_ngrams_back => {
									 'side'		 => 'back',
									 'max_gram' => 50,
									 'min_gram' => 2,
									 'type'		 => 'edgeNGram'
								},
								:name_middle_ngrams => {
									 'type'		 => 'nGram',
									 'max_gram' => 50,
									 'min_gram' => 2
								}
						 },
						 :analyzer => {
								:full_name => {
									'filter'		=> [ 'standard', 'lowercase','asciifolding','spanish_stop'],
									'type'			=> 'custom',
									'tokenizer' => 'standard'
								},
								:partial_name => {
									'type'			=> 'custom',
									'tokenizer' => 'standard',
									'filter'		=> ['standard','lowercase','asciifolding','name_ngrams','spanish_stop']		 
								},
								:partial_name_back => {
									'type'			 => 'custom',
									'tokenizer'	=> 'standard',
									'filter'		 => ['standard','lowercase','asciifolding','name_ngrams_back','spanish_stop']
								},
								:partial_middle_name => {
									'type' =>'custom',
									'tokenizer' => 'standard',
									'filter' => ['standard','lowercase','asciifolding','name_middle_ngrams','spanish_stop']
								}
							 }
						} do
				mapping do
					indexes :patient do
						indexes :firstname, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :lastname, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :birthdate, :type => 'date', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :height, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :weight, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
					indexes :allergies do
						indexes :cause, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :observations, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
					indexes :antecedents do
						indexes :description, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
					indexes :consultations do
						indexes :diagnostic, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :symptomps, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :treatment, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
					indexes :diseases do
						indexes :name, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :observations, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
					indexes :medications do
						indexes :name, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :route, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :dose, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :how_often, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
					indexes :vaccines do
						indexes :name, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
					indexes :medical_exams do
						indexes :name, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :results, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
						indexes :observations, :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
					end
			end
	end
end
