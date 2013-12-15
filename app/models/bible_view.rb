class BibleView #< ActiveRecord::Base
  include ActiveModel::Validations
  #are these two below necessary?
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :bible_version, :book, :chapter, :verse_from, :verse_to

  def initialize(params = {})
    self.bible_version = params[bible_version] || 'asv.xml'
    self.book = params[:book] || 'Genesis'
    self.chapter = params[:chapter] || '1'
    self.verse_from = params[:verse_from]
    self.verse_to = params[:verse_to]
  end

  def persisted?
    false
  end

  def update(params = {})
    p "I am the one who knocks!"
    #params.each do |name, value|
    #  self.name = value
    #end
  end
end
