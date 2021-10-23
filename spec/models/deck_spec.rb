require 'rails_helper'

RSpec.describe Deck, type: :model do
  it "generates 52 cards on init" do
    d = Deck.new

    expect(d.cards.size).to eq(52)
  end

  it "each card has suit and number" do
    d = Deck.new
    expect(d.cards.all? {|card| card[:suit] && card[:number]}).to eq(true)
  end

  it "can load deck instance from json" do
    g = Game.create
    d = Deck.new_from_json(g.deck_cards)
    expect(d.cards[0]).to eq({"suit"=>"clubs", "number"=>"ace"})
  end

  it "can deal cards to player" do
    g = Game.create
    g.players.create

    g.deck.deal_cards_to(7, g.players[0])
    expect(g.deck.cards.size).to eq(52 - 7)
  end
  
end
