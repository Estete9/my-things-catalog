module DisplayModule
  # Add your display objects logic here

  def list_all_labels
    @labels.each { |label| puts s_to_capital_letter(label) }
  end

  def list_all_books
    @books.each do |book|
      author_f_name = s_to_capital_letter(book.author.first_name)
      author_l_name = s_to_capital_letter(book.author.last_name)
      genre = s_to_capital_letter(book.genre.name)
      label_title = s_to_capital_letter(book.label.title)
      label_color = s_to_capital_letter(book.label.color)

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

  private

  def s_to_capital_letter(item)
    item[0].upcase + item[1..-1]
  end
end
