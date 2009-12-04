class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :user_id, :null => false
      t.integer :exercise_group_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
