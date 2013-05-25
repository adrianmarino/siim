class Article < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

	attr_accessible :title, :content, :published_on

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
        #should.string "title:#{a_text}" # , :boost => 5, :type => "phrase"
        #should.string "article.content.parcial:#{a_text}", :boost => 1
        #should.string "article.content.partial_middle:#{a_text}", :boost => 1
        #should.string "article.content.partial_back:#{a_text}", :boost => 1
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
        # highlight "content","content.parcial","content.partial_middle","content.partial_back",  :options => { :tag => '<strong class="highlight">' }
        highlight :title, :content, :options => { :tag => '<strong class="highlight">' }
      end
      @articles = search.results
    end
    @articles
  end
end
