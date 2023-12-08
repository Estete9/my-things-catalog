require_relative 'spec_helper'
require 'date'

describe 'music_album' do
  before(:each) do
    @music_album = MusicAlbum.new(true, Date.new(6 - 20 - 1983))
    @music_album.genre = double('Genre', name: 'Salsa')
    @music_album.author = double('Author', first_name: 'Ruben', last_name: 'Blades')
    @music_album.label = double('Label', title: 'Classic', color: 'Black')
    @music_album.publish_date = double('publish_date', year: 1983, month: 6, day: 20)
  end

  context '#initialize' do
    it 'sets the genre, author, and label in the inherited properties' do
      genre_name = 'Salsa'
      author_f_name = 'Ruben'
      author_l_name = 'Blades'
      label_title = 'Classic'
      label_color = 'Black'

      expect(@music_album.genre.name).to eql(genre_name)
      expect(@music_album.author.first_name).to eql(author_f_name)
      expect(@music_album.author.last_name).to eql(author_l_name)
      expect(@music_album.label.title).to eql(label_title)
      expect(@music_album.label.color).to eql(label_color)
    end
  end

  context '#can_be_archived?' do
    it 'returns true when super returns true and on_spotify is true' do
      allow(@music_album).to receive(:super).and_return(true)
      @music_album.on_spotify = true

      expect(@music_album.can_be_archived?).to be_truthy
    end

    it 'returns false when spotify is false' do
      allow(@music_album).to receive(:super).and_return(true)
      @music_album.on_spotify = false

      expect(@music_album.can_be_archived?).to be_falsey
    end
  end
end
