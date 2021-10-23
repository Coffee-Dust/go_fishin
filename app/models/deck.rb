class Deck
  attr_reader :cards

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

end
