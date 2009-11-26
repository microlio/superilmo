class AddTeacherFieldToExerciseGroup < ActiveRecord::Migration
  def self.up
    add_column :exercise_groups, :teacher, :string
  end

  def self.down
    remove_column :exercise_groups, :teacher
  end
end
