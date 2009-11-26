class AddFieldToCourseInstance < ActiveRecord::Migration
  def self.up
    add_column :course_instances, :name, :string
  end

  def self.down
    remove_column :course_instances, :name
  end
end
