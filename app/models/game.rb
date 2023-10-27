class Game < ApplicationRecord
  def self.today
    Game.create!(name: "Today's Game")
  end
end
