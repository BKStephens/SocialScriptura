class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_reference :users, :user_id, index: true
  end
end
