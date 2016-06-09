# This file was automatically generated for SuggestGrid by APIMATIC v2.0 ( https://apimatic.io ) on 06/09/2016

module SuggestGrid
  class GetTypeResponse

    # Either 'implicit' or 'explicit'
    # @return [String]
    attr_accessor :rating

    def initialize(rating = nil)
      @rating = rating

    end

    def method_missing(method_name)
      puts "There is no method called '#{method_name}'."
    end

    # Creates JSON of the curent object
    def to_json(options = {})
      hash = key_map
      hash.to_json(options)
    end

    # Creates an instance of the object from a hash
    def self.from_hash(hash)
      if hash == nil
        nil
      else
        # Extract variables from the hash
        rating = hash["rating"]
        # Create object from extracted values
        GetTypeResponse.new(rating)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['rating'] = rating
      hash
    end
  end
end
