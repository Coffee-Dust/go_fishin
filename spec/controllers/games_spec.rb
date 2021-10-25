require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "POST /games" do
    it "creates a new game instance" do
      post :create, {}
      expect(Game.all.last).to_not be_nil
    end

    it "redirects to game instance" do
      post :create, {}
      g = Game.all.last
      expect(response).to redirect_to("/games/#{g.room_code}")
    end

    it "adds you as a player in the session" do
      session[:player_id] = nil
      post :create, {}
      expect(session["player_id"]).to_not be_nil
    end

    it "adds you as a player in the game" do
      session[:player_id] = nil
      post :create, {}
      g = Game.all.last
      p = Player.find(session["player_id"])

      expect(p.game).to eq(g)
    end
  end

end
