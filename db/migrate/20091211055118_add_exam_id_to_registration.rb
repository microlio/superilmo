class AddExamIdToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :exam_id, :integer
  end

  def self.down
    remove_column :registrations, :exam_id
  end
end
