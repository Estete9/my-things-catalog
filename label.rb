class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label (self)
  end
end
