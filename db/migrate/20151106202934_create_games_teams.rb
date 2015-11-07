class CreateGamesTeams < ActiveRecord::Migration
  def change
    create_table :games_teams do |t|
      t.integer :game_id
      t.integer :team_id
      t.string :away_team
      t.string :home_team 
      t.timestamps null: false
    end
  end
end
