# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bible_search_cach, :class => 'BibleSearchCache' do
    bible_version "MyString"
    bible_book_abbreviation "MyString"
    chapter ""
    verse ""
    content "MyString"
    copyright "MyString"
  end
end
