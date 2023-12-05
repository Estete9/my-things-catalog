require 'date'
require_relative 'author'
require_relative 'genre'
require_relative 'label'

module CreateInstancesModule
   private
  
  # takes an item
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
