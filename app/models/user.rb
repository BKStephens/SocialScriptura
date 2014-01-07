class User < ActiveRecord::Base
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
  # has_many :inverse_relationships, :class_name => "Relationship", :foreign_key => "friend_id"
  # has_many :inverse_relations, :through => :inverse_relationships, :source => :user
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  
  # Setup accessible (or protected) attributes for your model
  def self.comments
    current_user.comment.all
  end

  #This is not needed in Rails 4
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :church, :denomination, :user_name, :full_name
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
