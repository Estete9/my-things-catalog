require 'spec_helper'
require 'fileutils'
require 'json'
require 'date'

describe FileManagerModule do
  include FileManagerModule
  let(:temp_dir) { File.join(File.dirname(__FILE__), 'temp_test_dir') }
  let(:book) { Book.new('penguin', 'bad', Date.parse('2006-12-12')) }
  let(:label) { Label.new('gift', 'red') }
  let(:genre) { Genre.new('Sci-Fi') }
  let(:author) { Author.new('Douglas', 'Adams') }

  before :each do
    FileUtils.mkdir_p(temp_dir)
    book.add_author(author)
    book.add_label(label)
    book.add_genre(genre)
  end

  after :each do
    FileUtils.rm_rf(temp_dir)
  end

  context '#save_to_json' do
    it 'saves the contents of the @books array' do
      filename = File.join(temp_dir, 'books.json')
      Date.parse('2006-12-12')
      expected_file_content = [book.to_h]

      save_to_json(book.to_h, filename)

      expect(File.exist?(filename)).to be(true)

      file_content = JSON.parse(File.read(filename))

      expect(file_content).to eq(expected_file_content)
    end

    it 'saves the contents of the @books array twice' do
      @books = []
      second_book = Book.new('astra', 'new', Date.parse('2016-12-12'))
      second_book.add_author(author)
      second_book.add_label(label)
      second_book.add_genre(genre)
      filename = File.join(temp_dir, 'books.json')
      expected_file_content = [book.to_h, second_book.to_h]

      @books << book
      @books << second_book
      @books.each do |book|
        save_to_json(book.to_h, filename)
      end

      expect(File.exist?(filename)).to be(true)

      file_content = JSON.parse(File.read(filename))

      expect(file_content).to eq(expected_file_content)
    end
  end
end
