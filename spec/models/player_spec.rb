require 'rails_helper'

RSpec.describe Player, type: :model do
  it "belongs to a game" do
    p = Player.create
    g = p.create_game
    expect(p.game).to_not be_nil
  end

  it "can receive cards from game deck" do
    g = Game.create
    p = g.players.create

    g.deck.deal_cards_to(7, g.players[0])
    p.reload
    expect(p.cards.size).to eq(7)
  end

end
