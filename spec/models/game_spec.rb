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
end
