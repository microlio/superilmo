class AddFieldToExerciseGroup < ActiveRecord::Migration
  def self.up
    add_column :exercise_groups, :course_instance_id, :integer
  end

  def self.down
    remove_column :exercise_groups, :course_instance_id
  end
end
