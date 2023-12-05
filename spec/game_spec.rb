require_relative 'spec_helper'
require 'date'

describe Game do
  before :each do
    @game = Game.new(true, Time.now - 3600, Time.now - 7200)
  end

  describe '#initialize' do
    it 'creates a new Game instance' do
      game = Game.new(true, Time.now - 3600, Time.now - 7200)
      expect(game).to be_an_instance_of(Game)
    end
  end

  context 'Inheritance from Item' do
    it 'confirms that the Game class inherits from Item' do
      expect(@game).to be_a(Item)
    end
  end

  describe '#can_be_archived?' do
    context 'when the game cannot be archived' do
      it 'returns false' do
        game = Game.new(true, Time.now - 3600, Time.now)
        expect(game.send(:can_be_archived?)).to eq(false)
      end
    end
  end

  describe '#move_to_archive' do
    context 'when the game cannot be archived' do
      it 'does not archive the game' do
        game = Game.new(true, Time.now - 3600, Time.now)
        game.move_to_archive
        expect(game.instance_variable_get(:@archived)).to eq(false)
      end
    end
  end
end
