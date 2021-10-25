class GamesController < ApplicationController
  def create
    @game = Game.create
    p = @game.players.create
    session["player_id"] = p.id
    redirect_to game_path(@game.room_code)
  end


  def index

  end

  def show

  end
end
