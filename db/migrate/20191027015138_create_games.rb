class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :category
      t.string :number_of_questions
      t.string :difficulty
      t.string :custom_name
      t.references :user, foreign_key: true
    end
  end
end
