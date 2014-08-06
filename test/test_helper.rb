ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include Devise::TestHelpers
  def setup
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryGirl.create(:user)
        sign_in @user 
    end
  
  # include Warden::Test::Helpers
  # Warden.test_mode!
      
  ActiveRecord::Migration.check_pending!

  #user = FactoryGirl.create(:user)
  #user.save
  #login_as(user, :scope => :user, :run_callbacks => false)
  
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  # Warden.test_reset! 
end
