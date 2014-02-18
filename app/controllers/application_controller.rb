class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from "WebMock::NetConnectNotAllowedError", with: :forbidden

private
  def forbidden(exception)
    render text: exception.message
  end

end
