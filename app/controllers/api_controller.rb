class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  
  def authenticate
  	authenticate_token || render_unauthorized("Access denied")
    
  end

  protected

  def render_unauthorized(message)
  	errors = {errors: [detail: message]}
  	render json: errors, status: :unauthorized
  end

  private

  def authenticate_token
  	authenticate_with_http_token do |token, options|
  		t = token if(token == 'connectwithapi')
    end
  end
end
