class Player < ApplicationRecord
  belongs_to :game

  def is_turn?
    self.game.current_player.id == self.id
  end

  def cards=(card_array)
    super({cards: card_array}.to_json)
  end

  def cards
    self[:cards] ? JSON.parse(self[:cards])["cards"] : []
  end
end
