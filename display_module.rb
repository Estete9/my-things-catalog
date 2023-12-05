module DisplayModule
  # Add your display objects logic here
  def list_all_books
    @books.each { |book| puts "Id: #{book.id}, Publisher: #{book.publisher}" }
  end
end
