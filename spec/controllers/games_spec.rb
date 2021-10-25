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

  describe "POST /games/join" do
    before do
      session[:player_id] = nil
      g = Game.create
      params = {room_code: g.room_code}
      post :join, params: {room_code: g.room_code}
    end

    it "will join game with valid code" do
      expect(response).to have_http_status(:redirect)
    end

    it "will add player to session" do
      expect(session["player_id"]).to_not be_nil
    end

    it "will add player to game" do
      g = Game.all.last
      p = Player.find(session["player_id"])

      expect(p.game).to eq(g)
    end
  end

end
