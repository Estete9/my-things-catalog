module DisplayModule
  # Add your display objects logic here

  def list_all_labels
    @labels.each { |label| puts "Label id: #{label.id}, label title: #{s_to_capital(label.title)}" }
  end

  def list_all_books
    @books.each do |book|
      author_f_name = s_to_capital(book.author.first_name)
      author_l_name = s_to_capital(book.author.last_name)
      genre = s_to_capital(book.genre.name)
      label_title = s_to_capital(book.label.title)
      label_color = s_to_capital(book.label.color)

      details = <<~DETAILS
        Author: #{author_f_name} #{author_l_name}
        Genre: #{genre}
        Label title: #{label_title}, Label color: #{label_color}
        Publisher: #{book.publisher}
        Id: #{book.id}
      DETAILS
      puts details
    end
  end

  def list_all_authors
    @authors = load_from_json('authors.json')
    puts 'List Authors'
    puts '-----------------------'
    @authors.each do |author|
      puts "ID: #{author.id}"
      puts "First Name: #{author.first_name}"
      puts "Last Name: #{author.last_name}"

      unless author.items.empty?
        puts 'Items:'
        author.items.each do |item|
          puts "  - #{item.to_json}"
        end
      end

      puts '-----------------------'
    end
  end

  def list_all_games
    @games = load_from_json('games.json')
    puts 'List Games'
    puts '-----------------------'
    @games.each do |game|
      author_f_name = s_to_capital(game.author.first_name)
      author_l_name = s_to_capital(game.author.last_name)
      genre = s_to_capital(game.genre.name)
      label_title = s_to_capital(game.label.title)
      label_color = s_to_capital(game.label.color)

      details = <<~DETAILS
        Author: #{author_f_name} #{author_l_name}
        Genre: #{genre}
        Label title: #{label_title}
        Label color: #{label_color}
        Publisher: #{game.publish_date}
        Id: #{game.id}
      DETAILS
      puts details
      puts '-----------------------'
    end
  end

  def list_all_music_albums
    puts ['List Albums', '-----------------------']
    @music_albums.each do |music_album|
      author_f_name = s_to_capital(music_album.author.first_name)
      author_l_name = s_to_capital(music_album.author.last_name)
      genre = s_to_capital(music_album.genre.name)
      label_title = s_to_capital(music_album.label.title)
      label_color = s_to_capital(music_album.label.color)

      details = <<~DETAILS
        Author: #{author_f_name} #{author_l_name}
        Genre: #{genre}
        Label title: #{label_title}
        Label color: #{label_color}
        Publisher: #{music_album.publish_date}
        Id: #{music_album.id}
      DETAILS
      puts [details, '-----------------------']
    end
  end

  private

  def s_to_capital(item)
    item[0].upcase + item[1..]
  end
end
