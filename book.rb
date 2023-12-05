require_relative 'item'

class Book < Item
  attr_accessor :cover_state

  def initialize(publisher, cover_state, publish_date, genre, author, label)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @genre = genre
    @author = author
    @label = label
  end

  def can_be_archived?
    super && cover_state == 'bad'
  end
end
