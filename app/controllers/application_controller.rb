# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :authorize, :except => [ :login, :index, :show ]
  before_filter :ownership, :only => [ :edit, :update, :destroy ]
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
    def authorize
      unless User.find_by_id(session[:user_id].to_i) 
        flash[:notice] = "Please log in" 
        redirect_to :controller => 'auth', :action => 'login'
      end 
    end
    
    def ownership
      unless session[:user_id].to_i == params[:id].to_i
#        flash[:notice] = "Please log in" 
        redirect_to :controller => 'auth', :action => 'index'
      end
    end
    
    def set_locale
      session[:locale] = params[:locale] if params[:locale]
      I18n.locale = session[:locale]
    end
  
end
