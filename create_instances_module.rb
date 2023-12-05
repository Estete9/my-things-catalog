require 'date'
require_relative 'author'
require_relative 'genre'
require_relative 'label'

module CreateInstancesModule
  def add_book
    p 'Add a publisher:'
    book_publisher = gets.chomp

    p 'Add cover state:'
    book_cover_state = gets.chomp

    p 'Add publish date (DD-MM-YYYY):'
    book_publish_date = ''

    loop do
      book_publish_date = Date.parse(gets.chomp)
      break
    rescue ArgumentError
      p 'Incorrect date format, please use DD-MM-YYYY format'
      p 'Add publish date (DD-MM-YYYY):'
    end

    new_book = Book.new(book_publisher, book_cover_state, book_publish_date)
    complete_book = item_with_details(new_book)

    @books << complete_book
  end
end
