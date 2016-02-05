class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in? ## This makes these methods available to the viewers!!
  
  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id] ## the || will set @current_user to the retrieved data so that it won't be necessary to call each times.
  end
  
  def logged_in? 
    !!current_user ##returns a boolean whether logged in or not (or if current_user is set to something.)
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action"
    #  redirect_to root_path
    redirect_to request.referer.present? ? :back : root_path
    end
  end
end
