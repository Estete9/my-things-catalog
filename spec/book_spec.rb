require_relative 'spec_helper'
require 'date'

describe Book do
  before :each do
    publisher = 'Penguin'
    cover_state = 'new'
    publish_date = Date.new(2005, 12, 12)

    @book = Book.new(publisher, cover_state, publish_date)
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
