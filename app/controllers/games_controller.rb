class GamesController < ApplicationController
  def create
    @game = Game.create
    p = @game.players.create
    session["player_id"] = p.id
    redirect_to game_path(@game.room_code)
  end

  def join
    @game = Game.find_by(room_code: params[:room_code])
    redirect_to games_path, alert: "Could not find room with that code!" if !@game

    if !@game.players.include?(helpers.current_player)
      p = @game.players.create
      session["player_id"] = p.id
    end
    redirect_to game_path(@game.room_code)
  end

  def index

  end

  def show
    @game = Game.find_by(room_code: params[:id])
    if @game && @game.players.include?(helpers.current_player)
      render :show
    else
      redirect_to games_path, status: 404
    end
end
