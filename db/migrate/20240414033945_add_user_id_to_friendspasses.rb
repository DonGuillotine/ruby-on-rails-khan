class AddUserIdToFriendspasses < ActiveRecord::Migration[7.0]
  def change
    add_column :friendspasses, :user_id, :integer
    add_index :friendspasses, :user_id
  end
end
