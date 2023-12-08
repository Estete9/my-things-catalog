require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_h(except: false)
    super.merge('on_spotify' => on_spotify)
  end

  def self.from_h(hash)
    new(
      hash['on_spotify'],
      Date.parse(hash['publish_date'])
    ).tap do |album|
      album.add_author(Author.from_h(hash['author'])) if hash.key?('author')
      album.add_genre(Genre.from_h(hash['genre'])) if hash.key?('genre')
      album.add_label(Label.from_h(hash['label'])) if hash.key?('label')
      album.id = hash['id'] if hash.key?('id')
    end
  end
end
