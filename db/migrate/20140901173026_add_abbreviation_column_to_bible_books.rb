class AddAbbreviationColumnToBibleBooks < ActiveRecord::Migration
  def change 
    add_column :bible_books, :abbreviation, :string
  end
end
