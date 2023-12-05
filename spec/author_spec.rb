require_relative 'spec_helper'

describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:item) { Item.new(Date.new(2010, 1, 1)) }

  describe '#initialize' do
    it 'sets a random id' do
      expect(author.id).to be_a(Integer)
    end

    it 'sets the first name' do
      expect(author.first_name).to eq('John')
    end

    it 'sets the last name' do
      expect(author.last_name).to eq('Doe')
    end

    it 'initializes an empty items array' do
      expect(author.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'calls add_author on the item' do
      expect(item).to receive(:add_author).with(author)
      author.add_item(item)
    end
  end
end
