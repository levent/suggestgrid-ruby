# This file was automatically generated for SuggestGrid by APIMATIC BETA v2.0 on 12/24/2015

module SuggestGrid
  class SpaceRequestBody

    # TODO: Write general description for this method
    # @return [Boolean]
    attr_accessor :fallback

    
    def method_missing (method_name)
      puts "there's no method called '#{method_name}'"
    end

    # Creates JSON of the curent object  
    def to_json
      hash = self.key_map()
      hash.to_json
    end

    # Defines the key map for json serialization  
    def key_map
      hash = {}
      hash['fallback'] = self.fallback
      hash
    end

  end
end