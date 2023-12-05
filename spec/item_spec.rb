require_relative 'spec_helper'

describe Item do
  context '#add_label' do
    it 'adds a label object to the item object' do
      publish_date = '2020-12-12'
      label_title = 'Gift'
      label_color = 'white'
      item = Item.new(publish_date)
      @label = Label.new(label_title, label_color)


      item.add_label(@label)

      expect(item.label.title).to eql(label_title)
      expect(item.label.color).to eql(label_color)
    end
  end
end
