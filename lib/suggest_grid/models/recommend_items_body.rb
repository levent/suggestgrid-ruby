# This file was automatically generated for SuggestGrid by APIMATIC BETA v2.0 on 12/14/2015

module SuggestGrid
  class RecommendItemsBody

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :userid

    # TODO: Write general description for this method
    # @return [Array<String>]
    attr_accessor :userids

    # TODO: Write general description for this method
    # @return [mixed]
    attr_accessor :filter

    # TODO: Write general description for this method
    # @return [Numeric]
    attr_accessor :size

    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :similar_itemid

    # These ids will not be included in the response.
    # @return [Array<String>]
    attr_accessor :except

    
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
      hash['userid'] = self.userid
      hash['userids'] = self.userids
      hash['filter'] = self.filter
      hash['size'] = self.size
      hash['similar_itemid'] = self.similar_itemid
      hash['except'] = self.except
      hash
    end

  end
end