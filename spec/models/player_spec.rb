require 'rails_helper'

RSpec.describe Player, type: :model do
  it "belongs to a game" do
    p = Player.create
    g = p.create_game
    expect(p.game).to_not be_nil
  end
end
