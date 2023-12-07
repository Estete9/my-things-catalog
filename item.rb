require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date, :id

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = false

    move_to_archive
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
  end

  def add_author(author)
    @author = author
  end

  def add_genre(genre)
    @genre = genre
  end

  def to_h(*)
    {
      'id' => @id,
      'publish_date' => @publish_date.to_s,
      'archived' => @archived,
      'label' => @label.to_h,
      'author' => @author.to_h,
      'genre' => @genre.to_h
    }
  end

  def self.from_h(hash, *_extra_args)
    new(Date.parse(hash['publish_date']))
  end

  private

  def can_be_archived?
    publish_year = @publish_date.year
    current_year = Date.today.year
    total_years = current_year - publish_year
    total_years > 10
  end
end
