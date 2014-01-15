class ChangeDataTypesOnComments < ActiveRecord::Migration
  def change
  	 execute 'ALTER TABLE comments ALTER COLUMN chapter_start TYPE integer USING (chapter_start::integer)'
  	 execute 'ALTER TABLE comments ALTER COLUMN verse_start TYPE integer USING (verse_start::integer)'
  	 execute 'ALTER TABLE comments ALTER COLUMN chapter_end TYPE integer USING (chapter_end::integer)'
  	 execute 'ALTER TABLE comments ALTER COLUMN verse_end TYPE integer USING (verse_end::integer)'
  end
end
