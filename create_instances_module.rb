require 'date'
require_relative 'author'
require_relative 'genre'
require_relative 'label'
require_relative 'game'

module CreateInstancesModule
  # Add your create objects logic here

  def add_book
    p 'Add a publisher:'
    book_publisher = gets.chomp

    p 'Add cover state:'
    book_cover_state = gets.chomp

    p 'Add publish date (DD-MM-YYYY):'
    book_publish_date = valid_date_input

    base_book = Book.new(book_publisher, book_cover_state, book_publish_date)
    complete_book = item_with_details(base_book)

    @books << complete_book
  end

  def add_game
    p "What's the publish date (DD-MM-YYYY)? :"
    game_p_year = valid_date_input
    p 'Is it a multiplayer game? [y/n]: '
    game_multiplayer = gets.chomp
    case game_multiplayer.downcase
    when 'y'
      true
    else
      false
    end
    p 'When was the last date (DD-MM-YYYY) that the game played?: '
    game_l_year = valid_date_input

    base_game = Game.new(game_multiplayer, game_l_year, game_p_year)
    complete_game = item_with_details(base_game)

    @games << complete_game
  end

  def valid_date_input
    loop do
      date_input = gets.chomp

      begin
        return Date.parse(date_input)
      rescue ArgumentError
        p 'Incorrect date format, please use DD-MM-YYYY format'
      end
    end
  end

  private

  # takes an item (a book, game, or music album)
  # asks for user input to create genre, author, and label objects
  # add these objects to the item
  def item_with_details(item)
    f_name = prompt_user("Add the author's first name:")
    l_name = prompt_user("Add the author's last name:")
    genre_name = prompt_user("Add the genre's name")
    label_title = prompt_user("Add the label's title")
    label_color = prompt_user("Add the label's color")

    author = Author.new(f_name, l_name)
    genre = Genre.new(genre_name)
    label = Label.new(label_title, label_color)

    @labels << label
    @genres << genre
    @authors << author

    item.author = author
    item.genre = genre
    item.label = label

    item
  end

  # takes a prompt, prints it, asks for user input, and returns the input
  def prompt_user(prompt)
    loop do
      p prompt
      input = gets.chomp.strip
      return input unless input.empty?

      p 'Empty value, try again'
    end
  end
end
