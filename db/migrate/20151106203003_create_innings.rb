class CreateInnings < ActiveRecord::Migration
  def change
    create_table :innings do |t|
      t.integer :game_id
      t.string :number
      t.string :away_team
      t.string :home_team
      t.string :next_inning
      t.timestamps null: false
    end
  end
end
