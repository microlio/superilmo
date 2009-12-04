class AdminController < ApplicationController

  skip_before_filter :is_authenticated?
  before_filter :admin_required
  
  def show
    
  end
  
  def admin_required
      
      
      r = Role.find_by_user_id(session[:user_id])
    
     if not r.nil?
      
       r.each do |u|
      
          if not u.nil?
            if u.role_type == "admin"
              return true
            end
          end
        
        end
      
    end
      
      return false
  end
  
end
