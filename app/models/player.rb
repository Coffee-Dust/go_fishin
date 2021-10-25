class Player < ApplicationRecord
  belongs_to :game

  def cards=(card_array)
    super({cards: card_array}.to_json)
  end

  def cards
    self[:cards] ? JSON.parse(self[:cards])["cards"] : []
  end
end
