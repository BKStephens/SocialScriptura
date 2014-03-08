class BibleView
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :bible_version, :book, :chapter, :verse_from, :verse_to

  def initialize(params = {})
    self.bible_version = params[:bible_version] || 'kjv.xml'
    self.book = params[:book] || 'Genesis'
    self.chapter = params[:chapter] || '1'
    self.verse_from = params[:verse_from]
    self.verse_to = params[:verse_to]
  end

  def persisted?
    false
  end
end
