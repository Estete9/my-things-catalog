class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date
    @archived = false
  end
end
