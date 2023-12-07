class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(title, color)
    @id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def to_h
    {
      'id' => id,
      'title' => title,
      'color' => color,
      'items' => items.map { |item| item.to_h(except: true) }
    }
  end
end
