class CreateAtBats < ActiveRecord::Migration
  def change
    create_table :at_bats do |t|
      t.integer :inning_id
      t.integer :pitcher_id
      t.integer :batter_id
      t.integer :outs
      t.string :stand
      t.integer :home_team_runs
      t.integer :away_team_runs
      t.timestamps null: false
    end
  end
end
