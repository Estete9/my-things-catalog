require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_h(except: false)
    super.merge('multiplayer' => multiplayer, 'last_played_at' => last_played_at)
  end

  def self.from_h(hash)
    new(
      hash['multiplayer'],
      hash['last_played_at'],
      Date.parse(hash['publish_date'])
    ).tap do |author|
      author.add_author(Author.from_h(hash['author'])) if hash.key?('author')
      author.add_genre(Genre.from_h(hash['genre'])) if hash.key?('genre')
      author.add_label(Label.from_h(hash['label'])) if hash.key?('label')
      author.id = hash['id'] if hash.key?('id')
    end
  end

  private

  def can_be_archived?
    super && Time.new.year - last_played_at > 2 unless last_played_at.nil?
  end
end
