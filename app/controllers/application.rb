# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
 
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_matricula2_session_id'
  
  protected
  def require_admin
    access_denied unless logged_in? && current_user.administrator?
  end

  def require_authentication
    access_denied unless logged_in?
  end


end
