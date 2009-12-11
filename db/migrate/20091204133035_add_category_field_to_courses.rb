class AddCategoryFieldToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :category_id, :integer
  end

  def self.down
    remove_column :courses, :category_id
  end
end