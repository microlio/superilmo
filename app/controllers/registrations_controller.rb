class RegistrationsController < ApplicationController

  def create
    Registration.create :user_id => session[:user_id], :exercise_group_id => params[:exercise_group_id]
    Newsfeed.join_exercise_group(User.find(session[:user_id]), ExerciseGroup.find(params[:exercise_group_id]))
    redirect_to (:controller => :exercise_groups, :action => :show, :id => params[:exercise_group_id])
  end

end
