require_relative 'spec_helper'

describe Book do
  before :each do
    publisher = 'Penguin'
    cover_state = 'New'
    publish_date = '2015-12-12'

    @book = Book.new(publisher, cover_state, publish_date)
  end

  context 'Inheritance from Item' do
    it 'confirms that the Book class inherits from Item' do
      expect(@book).to be_a(Item)
    end
  end
end
