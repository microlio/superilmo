class AddFieldFriendIdToFriendships < ActiveRecord::Migration
  def self.up
    add_column :friendships, :friend_id, :integer
  end

  def self.down
    remove_column :friendships, :friend_id
  end
end
