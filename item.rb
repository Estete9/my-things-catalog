require 'date'
require_relative 'book'

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

  def to_h(*, except: false)
    {
      'id' => @id,
      'publish_date' => @publish_date.to_s,
      'archived' => @archived,
      'label' => if except
                   { 'id' => @label.id, 'label_title' => @label.title,
                     'label_color' => @label.color }
                 else
                   @label.to_h
                 end,
      'author' => if except
                    { 'id' => @author.id, 'first_name' => @author.first_name,
                      'last_name' => @author.last_name }
                  else
                    @author.to_h
                  end,
      'genre' => except ? { 'id' => @genre.id, 'name' => @genre.name } : @genre.to_h
    }
  end

  private

  def can_be_archived?
    publish_year = @publish_date.year
    current_year = Date.today.year
    total_years = current_year - publish_year
    total_years > 10
  end
end
