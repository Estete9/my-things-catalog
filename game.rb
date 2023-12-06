require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_hash
    {
      'id' => id,
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at,
      'publish_date' => publish_date,
      'can_be_archived' => can_be_archived?
    }
  end

  private

  def can_be_archived?
    super && Time.new.year - last_played_at > 2
  end
end
