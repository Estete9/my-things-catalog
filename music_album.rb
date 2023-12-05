require_relative 'item'

class MusicAlbum < Item

  attr_accessor :on_spotify

  def initialize(genre, author, source, label, publish_date)
    super(publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @on_spotify = on_spotify 
  end

  def can_be_archived?
    super && @on_spotify
  end
end