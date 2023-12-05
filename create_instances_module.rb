require 'date'

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

    @books << Book.new(book_publisher, book_cover_state, book_publish_date)
  end
end
