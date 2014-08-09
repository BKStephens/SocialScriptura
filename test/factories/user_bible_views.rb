# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_bible_view do
    bible_version "MyString"
    book "MyString"
    chapter ""
    verse_from ""
    verse_to ""
  end
end
