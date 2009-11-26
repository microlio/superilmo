class AddNameFieldToExerciseGroup < ActiveRecord::Migration
  def self.up
    add_column :exercise_groups, :name, :string
  end

  def self.down
    remove_column :exercise_groups, :name
  end
end
