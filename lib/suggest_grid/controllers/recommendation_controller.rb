# This file was automatically generated for SuggestGrid by APIMATIC v2.0 ( https://apimatic.io ).

module SuggestGrid
  class RecommendationController < BaseController
    @@instance = RecommendationController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # Get Recommended Users
    # @param [GetRecommendedUsersBody] query Required parameter: The query for recommended users.
    # @return UsersResponse response from the API call
    def get_recommended_users(query)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/recommend/users'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.post _query_url, headers: _headers, parameters: query.to_json, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 400
        raise ErrorResponseException.new '400 - Request body is invalid.', _context
      elsif _response.status_code == 422
        raise ErrorResponseException.new '422 - Required parameters are missing.', _context
      elsif _response.status_code == 429
        raise ErrorResponseException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return UsersResponse.from_hash(decoded)
    end

    # Get Recommended Items
    # @param [GetRecommendedItemsBody] query Required parameter: The query for recommended items.
    # @return ItemsResponse response from the API call
    def get_recommended_items(query)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/recommend/items'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.post _query_url, headers: _headers, parameters: query.to_json, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 400
        raise ErrorResponseException.new '400 - Request body is invalid.', _context
      elsif _response.status_code == 422
        raise ErrorResponseException.new '422 - Required parameters are missing.', _context
      elsif _response.status_code == 429
        raise ErrorResponseException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return ItemsResponse.from_hash(decoded)
    end
  end
end
