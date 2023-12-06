require 'json'
require 'pry'

module FileManagerModule
  # Add your file management logic here
  def save_to_json(item_hash, filename)
    File.write(filename, JSON.dump(item_hash))
  end

  def load_from_json(filename)
    file_content = File.read(filename)
    JSON.parse(file_content)
  end
end
