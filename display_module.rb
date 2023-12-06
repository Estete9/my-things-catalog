module DisplayModule
  # Add your display objects logic here

  def list_all_labels
    @labels.each { |label| puts s_to_capital(label) }
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
    @authors.each { |author| puts s_to_capital(author) }
  end

  def list_all_games
    @games.each do |game|
      author_f_name = s_to_capital(game.author.first_name)
      author_l_name = s_to_capital(game.author.last_name)
      genre = s_to_capital(game.genre.name)
      label_title = s_to_capital(game.label.title)
      label_color = s_to_capital(game.label.color)

      details = <<~DETAILS
        Author: #{author_f_name} #{author_l_name}
        Genre: #{genre}
        Label title: #{label_title}, Label color: #{label_color}
        Publisher: #{game.publisher}
        Id: #{game.id}
      DETAILS
      puts details
    end
  end

  private

  def s_to_capital(item)
    item[0].upcase + item[1..]
  end
end
