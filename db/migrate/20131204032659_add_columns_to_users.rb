class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    add_column :users, :denomination, :string
    add_column :users, :church, :string
  end
end
