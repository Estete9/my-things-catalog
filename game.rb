require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && Time.new.year - last_played_at > 2
  end

  def to_h(except: false)
    super.merge('multiplayer' => multiplayer, 'last_played_at' => last_played_at)
  end
end
