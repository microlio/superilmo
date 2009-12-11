class AddColumnFriendshipIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :friendship_id, :integer
  end

  def self.down
    remove_column :users, :friendship_id
  end
end
