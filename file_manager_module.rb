
module FileManagerModule
  def save_books_to_json(books)
    books.each { |book| save_to_json(book.to_h, 'books.json') }
  end

  def save_games_to_json(games)
    games.each { |game| save_to_json(game.to_h, 'games.json') }
  end

  def save_music_albums(albums)
    albums.each { |album| save_to_json(album.to_h, 'music_albums.json') }
  end

  def save_labels_to_json(labels)
    labels.each { |label| save_to_json(label.to_h, 'labels.json') }
  end

  # Add your file management logic here
  def save_to_json(item_hash, filename)
    parsed_data = if File.exist?(filename)
                    data_from_file = File.read(filename)
                    data_from_file.empty? ? [] : JSON.parse(data_from_file)
                  else
                    []
                  end
    parsed_data.each do |data|
      if data['id'] == item_hash['id']
        next
      end
      parsed_data << item_hash
    end
    parsed_data = [parsed_data] unless parsed_data.is_a?(Array)

    stringyfied_data = JSON.pretty_generate(parsed_data)

    File.write(filename, stringyfied_data)
  end

  def load_from_json(filename)
    return [] unless File.exist?(filename)

    file_content = File.read(filename)
    JSON.parse(file_content)
  end
end
