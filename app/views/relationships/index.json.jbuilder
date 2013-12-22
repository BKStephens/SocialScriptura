json.array!(@relationships) do |relationship|
  json.extract! relationship, :user_id, :friend_id, :status
  json.url relationship_url(relationship, format: :json)
end
