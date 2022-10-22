module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :name, type: :text
      indexes :tag, type: :text
    end

    def self.search(query)
      self.__elasticsearch__.search(query)
    end
  end
end
