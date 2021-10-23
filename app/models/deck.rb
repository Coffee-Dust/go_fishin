class Deck
  attr_reader :cards

  def deal_cards_to(amount, player)
    if player.class == Player
      player.cards = self.cards.slice!(0, 7)
      player.save
    end
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def initialize
    @cards = []
    suits = ["clubs", "diamonds", "hearts", "spades"]
    numbers = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]
    
    suits.each do |suit|
      numbers.each do |number|
        @cards.push({suit: suit, number: number})
      end
    end
  end

  def self.new_from_json(cards_json)
    cards = JSON.parse(cards_json)["cards"]
    self.new.tap do |deck|
      deck.instance_variable_set("@cards", cards)
    end
  end

end
