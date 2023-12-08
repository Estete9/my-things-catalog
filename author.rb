class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end

  def to_h
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => items.map { |item| item.to_h(except: true) }
    }
  end

  def self.from_h(hash)
    new(
      hash['first_name'],
      hash['last_name']
    ).tap do |author|
      author.id_set(hash['id'])
    end
  end

  def id_set(id)
    @id = id
  end
end
