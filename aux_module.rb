module AuxModule
  # Takes a string and returns it capitalized
  def s_to_capital(item)
    item[0].upcase + item[1..]
  end

  def print_category_items(category)
    puts 'Items:'
    category.items.each do |item|
      puts "  - Type: #{item.class.name}, ID: #{item.id}, Publish Date: #{item.publish_date}"
    end
  end

  def details(*args)
    author_f_name, author_l_name, genre, label_title, label_color, item = args
    details = <<~DETAILS
      Author: #{author_f_name} #{author_l_name}
      Genre: #{genre}
      Label title: #{label_title}, Label color: #{label_color}
      Published: #{item.publish_date}
      Id: #{item.id}
    DETAILS
    puts details
  end
end
