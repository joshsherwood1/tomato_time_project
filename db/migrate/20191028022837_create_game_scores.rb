class CreateGameScores < ActiveRecord::Migration[5.2]
  def change
    create_table :game_scores do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
