require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super && cover_state == 'bad'
  end

  def to_h(except: false)
    super.merge('publisher' => publisher, 'cover_state' => cover_state)
  end

  def self.from_h(hash)
    new(
      hash['publisher'],
      hash['cover_state'],
      Date.parse(hash['publish_date'])
    ).tap do |book|
      book.add_author(Author.from_h(hash['author'])) if hash.key?('author')
      book.add_genre(Genre.from_h(hash['genre'])) if hash.key?('genre')
      book.add_label(Label.from_h(hash['label'])) if hash.key?('label')
      book.id = hash['id'] if hash.key?('id')
    end
  end
end
