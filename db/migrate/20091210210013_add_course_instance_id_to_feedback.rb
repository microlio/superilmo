class AddCourseInstanceIdToFeedback < ActiveRecord::Migration
  def self.up
    add_column :feedbacks, :course_instance_id, :integer
  end

  def self.down
    remove_column :feedbacks, :course_instance_id
  end
end
