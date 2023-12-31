class Genre
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def to_h
    {
      'id' => @id,
      'name' => @name,
      'items' => @items.map { |item| item.to_h(except: true) }
    }
  end

  def self.from_h(hash)
    new(
      hash['name']
    ).tap do |label|
      label.id_set(hash['id'])
    end
  end

  def id_set(id)
    @id = id
  end
end
