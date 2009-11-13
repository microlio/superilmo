class CoursesController < ApplicationController
  
#  layout "application"
  
  def index
     @courses = Course.find(:all)
  end
  
  def view
     @courses = Course.find(params[:id])
  end
  
  def new
    @course = Course.new
  end
  
  def create
      @course = Course.new(params[:course])
      
      if @course.save
        redirect_to(:action=>'index')
      else
        render :action=>:new
      end

  end
  

end
