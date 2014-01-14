class RemoveUserIdIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :user_id_id, :ID
  end
end
