require_relative 'aux_module'

module DisplayModule
  include AuxModule
  # Add your display objects logic here

  def list_all_labels
    puts 'List Labels'
    puts '-----------------------'
    @labels.each do |label|
      puts "ID: #{label.id}"
      puts "Title: #{label.title}"
      puts "Color: #{label.color}"

      print_category_items(label) unless label.items.empty?
      puts '-----------------------'
    end
  end

  def list_all_books
    puts 'List Books'
    puts '-----------------------'
    @books.each do |book|
      author_f_name = s_to_capital(book.author.first_name)
      author_l_name = s_to_capital(book.author.last_name)
      genre = s_to_capital(book.genre.name)
      label_title = s_to_capital(book.label.title)
      label_color = s_to_capital(book.label.color)
      details(author_f_name, author_l_name, genre, label_title, label_color, book)
      puts '-----------------------'
    end
  end

  def list_all_authors
    puts 'List Authors'
    puts '-----------------------'
    @authors.each do |author|
      puts "ID: #{author.id}"
      puts "First Name: #{author.first_name}"
      puts "Last Name: #{author.last_name}"

      print_category_items(author) unless author.items.empty?

      puts '-----------------------'
    end
  end
  
  def list_all_games
    puts 'List Games'
    puts '-----------------------'
    @games.each do |game|
      author_f_name = s_to_capital(game.author.first_name)
      author_l_name = s_to_capital(game.author.last_name)
      genre = s_to_capital(game.genre.name)
      label_title = s_to_capital(game.label.title)
      label_color = s_to_capital(game.label.color)

      details(author_f_name, author_l_name, genre, label_title, label_color, game)
      puts '-----------------------'
    end
  end

  def list_all_genres
    puts 'List all genres'
    puts '-----------------------'
    @genres.each do |genre|
      puts "ID: #{genre.id}"
      puts "Title: #{genre.name}"

      print_category_items(genre) unless genre.items.empty?
      puts '-----------------------'
    end
  end

  def list_all_music_albums
    puts 'List Albums'
    puts '-----------------------'
    @music_albums.each do |music_album|
      author_f_name = s_to_capital(music_album.author.first_name)
      author_l_name = s_to_capital(music_album.author.last_name)
      genre = s_to_capital(music_album.genre.name)
      label_title = s_to_capital(music_album.label.title)
      label_color = s_to_capital(music_album.label.color)
      details(author_f_name, author_l_name, genre, label_title, label_color, music_album)
      puts '-----------------------'
    end
  end
end
