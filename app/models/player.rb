class Player < ApplicationRecord
  belongs_to :game

  def cards=(card_array)
    @cards = {cards: card_array}.to_json
  end

  def cards
    @cards ? JSON.parse(@cards)["cards"] : []
  end
end
