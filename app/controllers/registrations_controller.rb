class RegistrationsController < ApplicationController

  def create
    
  #  if not ExerciseGroup.find(params[:exercise_group_id]).max_registrations.nil?
  
      @registrations = Registration.find_all_by_exercise_group_id(params[:exercise_group_id])
    
      if @registrations.nil? or @registrations.class == Array
    
        if (not @registrations.nil?) and @registrations.nitems >= ExerciseGroup.find(params[:exercise_group_id]).max_registrations
          redirect_to (:controller => :exercise_groups, :action => :show, :id => params[:exercise_group_id])
        else 
          Registration.create :user_id => :user_id, :exercise_group_id => params[:exercise_group_id], :exam_id => 0
          Newsfeed.join_exercise_group(User.find(session[:user_id]), ExerciseGroup.find(params[:exercise_group_id]))
          redirect_to (:controller => :exercise_groups, :action => :show, :id => params[:exercise_group_id])
        end
      end
    
  # end
  end
  
  def exam
    Registration.create :user_id => session[:user_id], :exam_id => params[:exam_id], :exercise_group_id => 0
    redirect_to (:controller => :exams, :action => :show, :id => params[:exam_id])
  end

end
