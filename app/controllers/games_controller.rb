class GamesController < ApplicationController
  helper_method :current_player

  def create
    @game = Game.create
    p = @game.players.create
    session["player_id"] = p.id
    redirect_to game_path(@game.room_code)
  end

  def join
    @game = Game.find_by(room_code: params[:room_code])
    redirect_to games_path, alert: "Could not find room with that code!" if !@game

    if !@game.players.include?(current_player)
      p = @game.players.create
      session["player_id"] = p.id
    end
    redirect_to game_path(@game.room_code)
  end

  def show
    @game = Game.find_by(room_code: params[:id])
    if @game && @game.players.include?(current_player)
      render :show
    else
      redirect_to games_path, status: 404
    end
  end

  def start
    @game = Game.find_by(room_code: params[:game_id])
    if @game && @game.players.include?(current_player) && @game.players.size > 1
      @game.start
      current_player.reload
    end
    render :show
  end

  def current_player
    @current_player ||= Player.find_by(id: session["player_id"])
  end
end
