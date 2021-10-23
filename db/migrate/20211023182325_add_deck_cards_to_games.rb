class AddDeckCardsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column(:games, :deck_cards, :string)
  end
end
