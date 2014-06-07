json.array!(@comments) do |comment|
  json.extract! comment, :verse_start, :verse_end, :description
  json.url comment_url(comment, format: :json)
end
