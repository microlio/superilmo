class CourseInstancesController < ApplicationController
 
  def show
    @ci = CourseInstance.find(params[:id])
  end
  
  def feedback
    
    @ci = CourseInstance.find(params[:id])
    @feedback = Feedback.new
    
    if not @cd.nil?
#      @ci.feedbacks.push(@feedback)
    end
  end
  
  def save_feedback
    @ci = CourseInstance.find(params[:id])
    @feedback = Feedback.new(params[:feedback])
    
    if @feedback.save
      @ci.feedbacks.push(@feedback)
      redirect_to(:action=>'show', :id => @ci.id)
    else
      render :action=>:feedback
    end
    
  end
 
end
