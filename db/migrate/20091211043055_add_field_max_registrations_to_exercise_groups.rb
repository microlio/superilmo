class AddFieldMaxRegistrationsToExerciseGroups < ActiveRecord::Migration
  def self.up
    add_column :exercise_groups, :max_registrations, :integer
  end

  def self.down
    remove_column :exercise_groups, :max_registrations
  end
end
