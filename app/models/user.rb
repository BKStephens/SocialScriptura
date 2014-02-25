class User < ActiveRecord::Base
  attr_accessor :comments_around_chapter, :most_recent_content_stream

  has_many :relationships
  has_many :relations, 
           :through => :relationships, 
           :source => :friend
  has_many :pending_friends,
           :through => :relationships,
           :source => :friend,
           :conditions => "status = 'requested'"
  has_many :accepted_friends,
           :through => :relationships,
           :source => :friend,
           :conditions => "status = 'accepted'"
  has_many :comments, dependent: :destroy

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
    self.relationships.content_stream(self, book, chapter)
  end

  def most_recent_content_stream
    self.relationships.most_recent_content_stream(self)
  end

  def self.comments
    current_user.comment.all
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
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
