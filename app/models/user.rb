class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  #This is not needed in Rails 4
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :church, :denomination, :user_name, :full_name
end
