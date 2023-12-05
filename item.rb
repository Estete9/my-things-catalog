requiere 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    publish_year = @publish_date.year
    total_years = Date.year - publish_year
    total_years > 10
  end
end
