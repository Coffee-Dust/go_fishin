class AddColumnIsStartedToGamesTable < ActiveRecord::Migration[6.0]
  def change
    add_column(:games, :is_started, :boolean, default: false)
  end
end
