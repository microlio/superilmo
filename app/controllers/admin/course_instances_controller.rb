class Admin::CourseInstancesController < AdminController
  
#  active_scaffold :course_instances
#    fb.columns.add :feedback
 # end
  
  def feedback
    @feedback = CourseInstance.find(params[:id]).feedbacks
  end
  
end
