require_relative 'book'
require_relative 'create_instances_module'
require_relative 'file_manager_module'
require_relative 'display_module'

class Main
  include CreateInstancesModule
  include FileManagerModule
  include DisplayModule

  def initialize()
    @books = []
    @games = []
    @music_albums = []
    @labels = []
    @authors = []
    @genres = []

    update_arrays
  end

  OPTIONS =
    { 1 => :list_all_books,
      2 => :list_all_music_albums,
      3 => :list_all_games,
      4 => :list_all_genres,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_book,
      8 => :add_music_album,
      9 => :add_game,
      10 => :exit_app }.freeze

  def display_menu
    puts 'MENU: '
    OPTIONS.each { |key, value| puts "#{key} - #{value.to_s.tr('_', ' ')}" }
    puts 'Please choose an option by entering a number: '
    gets.chomp.to_i
  end

  def run
    loop do
      option = display_menu
      handle_option(option)
    end
  end

  def handle_option(option)
    if OPTIONS.key?(option)
      send(OPTIONS[option])
    else
      puts 'Invalid option. Please choose a valid option'
    end
  end

  def exit_app
    puts 'Saving items...'
    save_books_to_json(@books)
    save_games_to_json(@games)
    save_labels_to_json(@labels)
    save_music_albums(@music_albums)
    puts 'Exiting the program'
    exit
  end

  def update_arrays
    data_from_books = load_from_json('books.json')
    @books = data_from_books.map { |book_hash| Book.from_h(book_hash) }

    data_from_games = load_from_json('games.json')
    @games = data_from_games.map { |game_hash| Book.from_h(game_hash) }
  end
end

main = Main.new
main.run
