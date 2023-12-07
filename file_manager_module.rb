require 'json'

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
    stringyfied_data = JSON.pretty_generate(parsed_data)

    File.write(filename, stringyfied_data)
  end

  def load_from_json(filename)
    file_content = File.read(filename)
    JSON.parse(file_content)
  end
end
