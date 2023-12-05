require_relative 'book'
require_relative 'create_instances_module'

class Main
  include CreateInstancesModule

  def initialize()
    @books = []
    @games = []
    @music_albums = []
    @labels = []
  end

  OPTIONS =
    { 1 => :list_all_books,
      2 => :list_all_music_albums,
      3 => :list_all_movies,
      4 => :list_all_games,
      5 => :list_all_genres,
      6 => :list_all_labels,
      7 => :list_all_authors,
      8 => :list_all_sources,
      9 => :add_book,
      10 => :add_music_album,
      11 => :add_movie,
      12 => :add_game,
      13 => :exit_app }.freeze

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
    puts 'Exiting the program'
    exit
  end
end

main = Main.new
main.run
