class User < ActiveRecord::Base
  attr_accessor :comments_around_chapter, :most_recent_content_stream
  require 'xml_parser'

  has_many :relationships
  has_many :relations, 
           :through => :relationships, 
           :source => :friend
  has_many :pending_friends,
           :through => :relationships,
           :source => :friend,
           :conditions => proc { "status = 'requested'" }
  has_many :accepted_friends,
           :through => :relationships,
           :source => :friend,
           :conditions => proc { "status = 'accepted'" }
  has_many :comments, dependent: :destroy
  has_one :bible_version, :class_name => 'BibleVersion'

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable :table_name => "messages",
                      :required   => [:topic, :body],
                      :class_name => "ActsAsMessageable::Message",
                      :dependent  => :destroy,
                      :group_messages => true

  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  def comments_around_chapter(book, chapter)
    comments_data = self.relationships.content_stream(self, book, chapter).to_a
    add_bible_verses_to_comments(comments_data)
  end

  def most_recent_content_stream
    comments_data = self.relationships.most_recent_content_stream(self).to_a
    add_bible_verses_to_comments(comments_data)
  end

  def add_bible_verses_to_comments(comments_data)
    parser = ::XmlParser.new

    single_comment_json = comments_data.map do |z|
      { :book_start => z.book_start,
        :chapters => z.chapters,
        :verse_start => z.verse_start,
        :verse_end => z.verse_end,
        :user_id => z.user_id,
        :user_name => z.user_name,
        :full_name => z.full_name,
        :description => z.description,
        :created_at => z.created_at.strftime("%m-%d-%Y at %H:%M:%S %p"),
        :verses => parser.parse_chapters_and_verses(
          'book' => z.book_start, 
          'chapter' => z.chapters, 
          'verse_start' => z.verse_start, 
          'verse_end' => z.verse_end, 
          'bible_version' => 'asv.xml' 
        )
      }
    end
    
    comments_json = { :comments => single_comment_json }
  end

  def self.comments
    current_user.comment.all
  end

  def self.all_comments
    Comment.all
  end

  def self.search(name)
    if name
      names = name.split(" ")
      #I need to refactor this to use full text searching with an index that also works with partial names. Ex. Ben for Benjamin.
      where('full_name ILIKE ? AND full_name ILIKE ? AND full_name ILIKE ? AND full_name ILIKE ?', "%#{names[0]}%", "%#{names[1]}%", "%#{names[2]}%", "%#{names[3]}%")
    else
      scoped
    end
  end

  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.user_name = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
      new session["devise.user_attributes"] do |user|
      	user.attributes = params
      	user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && provider.blank?
  end
  
  def email_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
