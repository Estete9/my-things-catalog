class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
<<<<<<< HEAD
    @items << item
    item.add_genre(self)
=======
    @item << item
    item.genre = self
>>>>>>> f846dad (Implement add_book method in create_instances_module)
  end
end
