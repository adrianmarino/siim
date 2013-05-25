class Article < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

	attr_accessible :title, :content, :published_on

  settings :number_of_shards => 1,
           :number_of_replicas => 1,
           :analysis => {
             :filter => {
               	:spanish_stop  => {
                	"type"     => "stop",
                	"stopwords_path" => "spanish_stop_words.txt"
               	}
             },
             :analyzer => {
               	:custom_analizer => {
                	"tokenizer"    => "standard",
                	"filter"       => ["standard", "lowercase", "asciifolding", "spanish_stop" ],
                	"type"         => "custom" 
               	}
             }
           } do
    mapping do
    	indexes :id,           :type => 'string', :index    => :not_analyzed
    	indexes :title,        :type => 'string', :analyzer => 'custom_analizer'
    	indexes :content,      :type => 'string', :analyzer => 'custom_analizer'
    	indexes :published_on, :type => 'date', 	:include_in_all => false
    end
  end
end