require 'rails_helper'

RSpec.describe Game, type: :model do
  it "has a room code auto generated" do
    g = Game.create
    expect(g.room_code).to_not be_nil
  end

  it "has uniq room code generated" do
    100.times do
      Game.create
    end
    g = Game.new
    g.generate_room_code
    expect(Game.find_by(room_code: g.room_code)).to be_nil
  end

  it "has many players" do
    g = Game.create
    g.players.create
    g.players.create
    
    expect(g.players.size).to eq(2)
  end

  it "correctly parses deck_cards into deck instance" do
    g = Game.create

    expect(g.deck.class).to eq(Deck)
  end

  it "has a deck of cards on creation" do
    g = Game.create

    expect(g.deck.cards.size).to eq(52)
  end

end
