class AuthController < ApplicationController
  def login 
    if request.post?
      user = User.authenticate(params[:username], params[:password]) 
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")
      else
        flash.now[:notice] = "Invalid user/password combination"
      end 
    end
  end

  def logout 
    session[:user_id] = nil 
    flash[:notice] = "Logged out" 
    redirect_to(:action => "index")
  end

  def index
    @login = nil
  end

end
