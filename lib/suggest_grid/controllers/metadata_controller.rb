# This file was automatically generated for SuggestGrid by APIMATIC v2.0 ( https://apimatic.io ).

module SuggestGrid
  class MetadataController < BaseController
    @@instance = MetadataController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # Delete a User
    # @param [String] user_id Required parameter: The user_id to delete its metadata.
    # @return MessageResponse response from the API call
    def delete_user(user_id)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/users/{user_id}'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'user_id' => user_id
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.delete _query_url, headers: _headers, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end

    # Get Users
    # @return MetadataInformationResponse response from the API call
    def get_users
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/users'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MetadataInformationResponse.from_hash(decoded)
    end

    # Post a User
    # @param [Metadata] metadata Required parameter: The metadata to be saved. Metadata format has its restrictions.
    # @return MessageResponse response from the API call
    def post_user(metadata)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/users'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.post _query_url, headers: _headers, parameters: metadata.to_json, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
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
        raise APIException.new '400 - Metadata is invalid.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end

    # Delete All Users
    # @return MessageResponse response from the API call
    def delete_all_users
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/users'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.delete _query_url, headers: _headers, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end

    # Delete an Item
    # @param [String] item_id Required parameter: The item_id to delete its metadata.
    # @return MessageResponse response from the API call
    def delete_item(item_id)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/items/{item_id}'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'item_id' => item_id
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.delete _query_url, headers: _headers, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end

    # Get Items
    # @return MetadataInformationResponse response from the API call
    def get_items
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/items'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MetadataInformationResponse.from_hash(decoded)
    end

    # Post an Item
    # @param [Metadata] body Required parameter: The metadata to be saved. Metadata format has its restrictions.
    # @return MessageResponse response from the API call
    def post_item(body)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/items'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.post _query_url, headers: _headers, parameters: body.to_json, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
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
        raise APIException.new '400 - Metadata is invalid.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end

    # Delete All Items
    # @return MessageResponse response from the API call
    def delete_all_items
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/items'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.delete _query_url, headers: _headers, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end

    # Post Bulk Users
    # @param [String] body Required parameter: A number of user metadata objects separated with newlines. Each user metadata object must have its id field. Note that this is not a valid JSON data structure. The body size is limited to 10 thousand lines.
    # @return MessageResponse response from the API call
    def post_bulk_users(body)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/users/_bulk'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json',
        'content-type' => 'text/plain; charset=utf-8'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.post _query_url, headers: _headers, parameters: body, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 209
        raise APIException.new '209 - Some metadata is not uploaded successfully.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end

    # Post Bulk Items
    # @param [String] body Required parameter: A number of item metadata objects separated with newlines. Each item metadata object must have its id field. Note that this is not a valid JSON data structure. The body size is limited to 10 thousand lines.
    # @return MessageResponse response from the API call
    def post_bulk_items(body)
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/items/_bulk'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'SUGGESTGRID',
        'accept' => 'application/json',
        'content-type' => 'text/plain; charset=utf-8'
      }

      # Create the HttpRequest object for the call
      _request = @http_client.post _query_url, headers: _headers, parameters: body, username: Configuration.basic_auth_user_name, password: Configuration.basic_auth_password
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 209
        raise APIException.new '209 - Some metadata is not uploaded successfully.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too many requests.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Unexpected internal error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return MessageResponse.from_hash(decoded)
    end
  end
end
