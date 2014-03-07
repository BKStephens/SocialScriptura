class CreateBibleVersions < ActiveRecord::Migration
  def change
    create_table :bible_versions do |t|
      t.string :name
      t.string :abbreviation
      t.string :file_name

      t.timestamps
    end
  end
end
