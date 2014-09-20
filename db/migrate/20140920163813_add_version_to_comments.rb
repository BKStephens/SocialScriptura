class AddVersionToComments < ActiveRecord::Migration
  def change
    add_column :comments, :bible_version, :string
  end
end
