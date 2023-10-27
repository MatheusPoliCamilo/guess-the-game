class CreateGuesses < ActiveRecord::Migration[7.1]
  def change
    create_table :guesses do |t|
      t.belongs_to :player_game, null: false, foreign_key: true
      t.string :name
      t.integer :similarity

      t.timestamps
    end
  end
end
