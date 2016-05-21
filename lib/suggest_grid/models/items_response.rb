# This file was automatically generated for SuggestGrid by APIMATIC v2.0 ( https://apimatic.io ) on 05/21/2016

module SuggestGrid
  class ItemsResponse

    # The number of item_ids in the response.
    # @return [Long]
    attr_accessor :count

    # TODO: Write general description for this method
    # @return [List of ItemsModel]
    attr_accessor :items

    def initialize(count = nil,
                   items = nil)
      @count = count
      @items = items

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
        count = hash["count"]
        # Parameter is an array, so we need to iterate through it
        items = nil
        if hash["items"] != nil
          items = Array.new
          hash["items"].each{|structure| items << ItemsModel.from_hash(structure)}
        end
        # Create object from extracted values
        ItemsResponse.new(count,
                          items)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['count'] = count
      hash['items'] = items.map(&:key_map)
      hash
    end
  end
end