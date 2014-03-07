class AddForeignKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bible_version_id, :integer
  end
end
