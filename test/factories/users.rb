# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
  	f.sequence(:email) { |n| "foo#{n}@example.com" }
    f.sequence(:user_name) { |n| "foo#{n}" }
    f.password "secret!!"
    f.password_confirmation "secret!!"
   end
end