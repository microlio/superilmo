class CreateExerciseGroups < ActiveRecord::Migration
  def self.up
    create_table :exercise_groups do |t|
      t.teacher :string
      t.course_instance_id :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_groups
  end
end
