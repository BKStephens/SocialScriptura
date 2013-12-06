json.array!(@comments) do |comment|
  json.extract! comment, :bible_verse_start, :bible_verse_end, :description, :date_time_stamp
  json.url comment_url(comment, format: :json)
end
