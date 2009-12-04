class CoursesController < ApplicationController
  
#  layout "application"
  
  def index
     @newsfeed = Newsfeed.all
     @courses = Course.find(:all)
     
     respond_to do |format|
       format.html
       format.rss
     end
  end
  
  def show
     @courses = Course.find(params[:id])
  end
  
  def new
    @course = Course.new
  end
  
  def create
      @course = Course.new(params[:course])
      
      if @course.save
     #   Newsfeed.course_added(@course)
        redirect_to(:action=>'index')
      else
        render :action=>:new
      end

  end
  

end
