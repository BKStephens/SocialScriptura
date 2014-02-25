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

  def self.content_stream(user, book, chapter)
    comments = Array.new
    chapters_hash = chapters_around_chapter(chapter)

    user.accepted_friends.each do |r|
      comments << r.comments.where(:book_start => book, :chapter_start => (chapters_hash['chapter_before_floor']..chapters_hash['chapter_after_ceiling']))
    end

    return comments
  end

  def self.most_recent_content_stream(user)
    comments = Array.new
    
    user.accepted_friends.each do |r|
      comments << r.comments.order("created_at DESC").all
    end

    return comments
  end

  private
    def self.chapters_around_chapter(chapter)
      chapter_before_floor = chapter.to_i - 5 >= 1 ? chapter.to_i - 5 : 1 
      chapter_after_ceiling = chapter.to_i + 5
      chapters_hash = {"chapter_before_floor" => chapter_before_floor, "chapter_after_ceiling" => chapter_after_ceiling}
    end
end
