require 'json'
require 'pry'

module FileManagerModule
  # Add your file management logic here
  def save_to_json(item_hash, filename)

parsed_data = if File.exist?(filename)
                data_from_file = File.read(filename)
                JSON.parse(data_from_file)
              else
                []
              end

    parsed_data << item_hash

    File.write(filename, JSON.dump(parsed_data))
  end

  def load_from_json(filename)
    file_content = File.read(filename)
    JSON.parse(file_content)
  end
end


# def save_to_json(item_hash, filename)
#     # binding.pry



#     parsed_data = if File.exist?(filename)
#                     data_from_file = File.read(filename)
#                     data_from_file.empty? ? [] : JSON.parse(data_from_file)
#                   else
#                     []
#                   end

#     parsed_data << item_hash

#     File.write(filename, JSON.dump(parsed_data))
#   end
