class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

   def self.request(user, friend)
    #unless user == friend or Relationship.exists?(:user_id => user, :friend_id => friend)
      transaction do
        create(:user => user, :friend => friend, :status => 'pending')
        create(:user => friend, :friend => user, :status => 'requested')
      #end
      #return User.find(user)
    end
  end

  def self.accept(user, friend)
    transaction do
      accepted_at = Time.now
      accept_one_side(user, friend, accepted_at)
      accept_one_side(friend, user, accepted_at)
    end
  end

  def self.accept_one_side(user, friend, accepted_at)
    request = find_by_user_id_and_friend_id(user, friend)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end
end
