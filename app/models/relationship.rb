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
    chapters_hash = chapters_around_chapter(chapter)
    user_ids = user.accepted_friends.pluck('users.id').to_a
    user_ids << user[:id].to_i
    
    comments = User.all_comments
    .select('comments.created_at, book_start, bible_chapters.chapters, verse_start, verse_end, user_id, user_name, full_name, comments.description')
    .joins('INNER JOIN users ON comments.user_id = users.id')
    .joins('INNER JOIN bible_chapters ON comments.chapter_start = bible_chapters.id')
    .where(
      :user_id => user_ids,
      :book_start => book,
      'bible_chapters.chapters' => (chapters_hash['chapter_before_floor']..chapters_hash['chapter_after_ceiling'])
    )
    .order('comments.created_at DESC').to_a
  end

  def self.most_recent_content_stream(user)
    user_ids = user.accepted_friends.pluck('users.id').to_a
    user_ids << user[:id].to_i
    
    comments = User.all_comments
    .select('comments.created_at, book_start, bible_chapters.chapters, verse_start, verse_end, user_id, user_name, full_name, comments.description')
    .joins('INNER JOIN users ON comments.user_id = users.id')
    .joins('INNER JOIN bible_chapters ON comments.chapter_start = bible_chapters.id')
    .where(
      :user_id => user_ids
    )
    .order('comments.created_at DESC').to_a
  end

  private
    def self.chapters_around_chapter(chapter)
      chapter_before_floor = chapter.to_i - 5 >= 1 ? chapter.to_i - 5 : 1 
      chapter_after_ceiling = chapter.to_i + 5
      chapters_hash = {"chapter_before_floor" => chapter_before_floor, "chapter_after_ceiling" => chapter_after_ceiling}
    end
end
