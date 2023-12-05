require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre_name = 'Salsa'
    @genre = Genre.new(@genre_name)
  end

  context '#name' do
    it 'gets the name of the genre' do
      expect(@genre.name).to eql(@genre_name)
    end

    it 'sets the name of the genre' do
      new_name = 'Merengue'

      @genre.name = new_name
      expect(@genre.name).to eql(new_name)
    end
  end

  context '#add_item' do
    it 'updates the genre of the item' do
      genre_name = 'Salsa'
      publish_date = '2023-05-12'
      item = Item.new(publish_date)
      @genre.add_item(item)

      expect(@genre.items[0].genre.name).to eql(genre_name)
    end
  end
end
