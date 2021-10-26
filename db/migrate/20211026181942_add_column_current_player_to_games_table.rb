class AddColumnCurrentPlayerToGamesTable < ActiveRecord::Migration[6.0]
  def change
    add_column(:games, :current_player_id, :number)
  end
end
