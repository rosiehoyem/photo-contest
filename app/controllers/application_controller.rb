class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#   class NotInitiated < StandardError
#   end

#   rescue_from NotInitiated, :with => :not_initiated

#   def show
#     @exception = env["action_dispatch.exception"]
#     render action: request.path[1..-1]
#   end


# private

#   def not_initiated(exception)
#     flash[:notice] = "I'm sorry, your contest was not initiated."
#     Event.new_event "Exception: #{exception.message}", current_user, request.remote_ip
#     redirect_to new_contest_path
#   end

end
