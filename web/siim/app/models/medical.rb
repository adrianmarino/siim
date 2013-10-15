class Medical < ActiveRecord::Base
  include Comparable
  include Tire::Model::Search
  include Tire::Model::Callbacks

  # -------------------------------------------------------------------------
  # Attributes...
  # -------------------------------------------------------------------------
  attr_accessible :cuil, :dni, :email, :firstname, :lastname,
    :home_phone, :movile_phone, :medical_specialization,
    :medical_specialization_id, :attention_periods, 
    :attention_time_length_hour, :attention_time_length_minutes, :user,
    :user_id, :registration_number

  # -------------------------------------------------------------------------
  # Associations...
  # -------------------------------------------------------------------------
  belongs_to :medical_specialization
  belongs_to :user
  has_many :consultations
  has_many :attention_periods

  # -------------------------------------------------------------------------
  # Validations...
  # -------------------------------------------------------------------------
  #validates :cuil, :dni, :firstname, :lastname, :medical_specialization, :email,
  #  :movile_phone, :presence => true

  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def to_s
    "#{firstname} #{lastname}"
  end

  def <=>(an_other)
    if self.to_s < an_other.to_s
      -1
    elsif self.to_s > an_other.to_s
      1
    else
      0
    end
  end

  def attention_periods_on(a_date)
    attention_periods.select do |a_period| a_period.week_day == a_date.wday end
  end

  def appointments_by_period_on(a_date)
    periods = attention_periods_on a_date
    periods.collect do |a_period|
      begin_time = a_period.begin_time_on a_date
      end_time = a_period.end_time_on a_date
      lenght = attention_length_time
      TimeHelper.create_times start_time: begin_time, end_time: end_time, increment: lenght
    end
  end

  def appointments_on(a_date)
    self.appointments_by_period_on(a_date).flatten
  end

  def attention_length_time
    Time.new_from hour: self.attention_time_length_hour, min: self.attention_time_length_minutes
  end

  settings :number_of_shards => 1,
           :number_of_replicas => 1,
           :analysis => {
             :filter => {
                :spanish_stop  => {
                  'type'           => 'stop',
                  'stopwords_path' => 'spanish_stop_words.txt'
                },
                :name_ngrams => {
                  'type'      => 'edgeNGram',
                  'side'      => 'front',
                  'max_gram'  => 50,
                  'min_gram'  => 2
                },
                :name_ngrams_back => {
                   'side'     => 'back',
                   'max_gram' => 50,
                   'min_gram' => 2,
                   'type'     => 'edgeNGram'
                },
                :name_middle_ngrams => {
                   'type'     => 'nGram',
                   'max_gram' => 50,
                   'min_gram' => 2
                }
             },
             :analyzer => {
                :full_name => {
                  'filter'    => [ 'standard', 'lowercase','asciifolding','spanish_stop'],
                  'type'      => 'custom',
                  'tokenizer' => 'standard'
                },
                :partial_name => {
                  'type'      => 'custom',
                  'tokenizer' => 'standard',
                  'filter'    => ['standard','lowercase','asciifolding','name_ngrams','spanish_stop']     
                },
                :partial_name_back => {
                  'type'       => 'custom',
                  'tokenizer'  => 'standard',
                  'filter'     => ['standard','lowercase','asciifolding','name_ngrams_back','spanish_stop']
                },
                :partial_middle_name => {
                  'type' =>'custom',
                  'tokenizer' => 'standard',
                  'filter' => ['standard','lowercase','asciifolding','name_middle_ngrams','spanish_stop']
                }
               }              
             } do
        mapping do
          indexes :id,           :type => 'string', :index => :not_analyzed
          indexes :title,        :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
          indexes :content,      :type => 'string', :index_analyzer => 'partial_middle_name' ,:search_analyzer => 'full_name'
          indexes :published_on, :type => 'date',   :include_in_all => false
          # indexes :contents do
          #   mapping do
          #     indexes :content, :type => 'multi_field',
          #       :fields => {
          #           "partial"         => {
          #             "search_analyzer"   => "full_name",
          #             "index_analyzer"    => "partial_name",
          #             "type"              => "string"
          #           },
          #           "partial_back"    => {
          #             "search_analyzer"   => "full_name",
          #             "index_analyzer"    => "partial_name_back",
          #             "type"              => "string"
          #           },
          #           "partial_middle"  => {
          #             "search_analyzer"   => "full_name",
          #             "index_analyzer"    => "partial_middle_name",
          #             "type"              => "string"
          #           },
          #           "content"         => {
          #             "type"              => "string",
          #             "analyzer"          => "full_name"
          #           }
          #        }
          #   end
          # end
      end
  end

  def self.text_search(a_text) 
    if a_text.empty?
      @articles = Article.all 
    else
      content_query = lambda do |should|
        should.string "content:#{a_text}" # , :boost => 5, :type => "phrase"
      end
      title_query = lambda do |should|
        should.string "title:#{a_text}" # , :boost => 5, :type => "phrase"
      end
      search = Tire.search 'articles' do
        query do
          boolean do
            should &content_query
            should &title_query
          end
        end
        highlight :title, :content, :options => { :tag => '<strong class="highlight">' }
      end
      @articles = search.results
    end
    @articles
  end
end
