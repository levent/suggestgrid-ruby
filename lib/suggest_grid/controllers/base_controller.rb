# This file was automatically generated for SuggestGrid by APIMATIC v2.0 ( https://apimatic.io ) on 05/21/2016

module SuggestGrid
  class BaseController
    def validate_response(response)			
      if !response.code.between?(200, 206) #[200,206] = HTTP OK
        raise APIException.new 'HTTP Response Not OK', response.code, response.body
      end
    end
  end
end