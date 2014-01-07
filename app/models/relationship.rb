class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

   def self.request(user, friend)
     unless user == friend or Relationship.exists?(:user_id => user, :friend_id => friend)
       transaction do
         create(:user => user, :friend => friend, :status => 'pending')
         create(:user => friend, :friend => user, :status => 'requested')
       end
     end
  end

  def self.accept(user, friend)
    transaction do
      accept_one_side(user, friend)
      accept_one_side(friend, user)
    end
  end

  def self.accept_one_side(user, friend)
    request = find_by_user_id_and_friend_id(user, friend)
    request.status = 'accepted'
    request.save!
  end

  def self.destroy(user, friend)
    transaction do
      destroy_one_side(user, friend)
      destroy_one_side(friend, user)
    end
  end

  def self.destroy_one_side(user, friend)
    request = find_by_user_id_and_friend_id(user, friend)
    request.destroy!
  end  

  def self.content_stream(user)
    comments = []

    user.accepted_friends.each do |r|
      comments << r.comments
    end

    return comments
  end
end
