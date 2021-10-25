require 'rails_helper'
RSpec.describe "Games", type: :system do

  describe "Gameplay system" do
    it "Will create a new player for game on joining" do
      g = Game.create
      visit "/games"
      fill_in "room_code", with: g.room_code
      click_button "Join"

      expect(g.players.size).to eq(1)
    end
  end


  describe "Index View" do
    it "VIEW index: will create new game on button click" do
      visit "/games"
      click_button "Create New Game"
      g = Game.all.last

      expect(page).to have_text(g.room_code)
    end

    it "VIEW index: will join game with a valid room_code" do
      g = Game.create
      visit "/games"
      fill_in "room_code", with: g.room_code
      click_button "Join"
      expect(page).to have_text("Waiting on players")
    end
  end

end