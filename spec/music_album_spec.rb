require_relative 'spec_helper'
require 'date'

describe 'music_album' do
  before(:each) do
    @publish_date = Date.new( 06/20/1983) 

    @book = Book.new(publisher, cover_state, publish_date)
    @book.genre = instance_double('Genre', name: 'Science Fiction')
    @book.author = instance_double('Author', first_name: 'Douglas', last_name: 'Adams')
    @book.label = instance_double('Label', title: 'Gift', color: 'Black')
  end

  context ''

end
