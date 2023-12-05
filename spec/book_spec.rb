require_relative 'spec_helper'
require 'date'

describe Book do
  before :each do
    publisher = 'Penguin'
    cover_state = 'new'
    publish_date = Date.new(2005, 12, 12)
    @genre = instance_double('Genre', name: 'Science Fiction')
    @author = instance_double('Author', first_name: 'Douglas', last_name: 'Adams')
    @label = instance_double('Label', title: 'Gift', color: 'Black')

    @book = Book.new(publisher, cover_state, publish_date, @genre, @author, @label)
  end

  context '#initialize' do
    it 'sets the genre, author, and label in the inherited properties' do
      genre_name = 'Science Fiction'
      author_f_name = 'Douglas'
      author_l_name = 'Adams'
      label_title = 'Gift'
      lable_color = 'Black'

      expect(@book.genre.name).to eql(genre_name)
      expect(@book.author.first_name).to eql(author_f_name)
      expect(@book.author.last_name).to eql(author_l_name)
      expect(@book.label.title).to eql(label_title)
      expect(@book.label.color).to eql(lable_color)
    end
  end

  context 'Inheritance from Item' do
    it 'confirms that the Book class inherits from Item' do
      expect(@book).to be_a(Item)
    end
  end

  context '#can_be_archived?' do
    it 'returns false if the cover state is not bad' do
      expect(@book.can_be_archived?).to be(false)
    end

    it 'returns false if the date of publication is newer than 10 years' do
      @book.cover_state = 'bad'
      @book.publish_date = Date.new(2015, 12, 12)

      expect(@book.can_be_archived?).to be(false)
    end

    it 'returns true if the date of publication is older than 10 years AND the cover_state is bad' do
      @book.cover_state = 'bad'

      expect(@book.can_be_archived?).to be(true)
    end
  end
end
