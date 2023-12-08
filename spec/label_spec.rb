require_relative 'spec_helper'

require 'date'

describe Label do
  before :each do
    title = 'Gift'
    color = 'Black'
    @label = Label.new(title, color)
  end

  context '#title' do
    it 'gets the title of the label' do
      label_title = 'Gift'

      expect(@label.title).to eql(label_title)
    end

    it 'sets the title of the label' do
      new_title = 'New'

      @label.title = new_title

      expect(@label.title).to eql(new_title)
    end
  end

  context '#color' do
    it 'gets the color of the label' do
      label_color = 'Black'

      expect(@label.color).to eql(label_color)
    end

    it 'sets the color of the label' do
      new_color = 'White'

      @label.color = new_color

      expect(@label.color).to eql(new_color)
    end
  end

  context '#add_item' do
    it 'adds an Item object to the items array property' do
      publish_date = Date.parse('2020-12-12')
      item = Item.new(publish_date)

      @label.add_item(item)

      expect(@label.items.length).to eql(1)
    end

    it 'updates the label of the item' do
      label_title = 'Gift'
      publish_date = Date.parse('2020-12-12')
      item = Item.new(publish_date)
      @label.add_item(item)

      expect(@label.items[0].label.title).to eql(label_title)
    end
  end
end
