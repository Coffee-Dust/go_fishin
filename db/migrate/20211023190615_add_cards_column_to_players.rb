class AddCardsColumnToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column(:players, :cards, :string)
  end
end
