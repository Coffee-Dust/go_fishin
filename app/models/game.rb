class Game < ApplicationRecord
  has_many :players
  after_initialize :set_defaults, unless: :persisted?

  def deck
    @deck ||= Deck.new_from_json(self.deck_cards)
  end

  def start
    self.is_started = true
    for player in self.players do
      self.deck.deal_cards_to(7, player)
    end
    self.save
  end

  def set_defaults
    self.room_code = generate_room_code
    self.deck_cards = {cards: Deck.new.cards}.to_json
  end

  def generate_room_code
    chars = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    code = ""
    6.times do 
      code += chars[rand(chars.size)]
    end
    if self.class.find_by(room_code: code)
      generate_room_code
    else
      return code
    end
  end

end
