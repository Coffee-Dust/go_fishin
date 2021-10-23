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
end
