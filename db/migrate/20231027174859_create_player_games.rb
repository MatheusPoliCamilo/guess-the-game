class CreatePlayerGames < ActiveRecord::Migration[7.1]
  def change
    create_table :player_games do |t|
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
