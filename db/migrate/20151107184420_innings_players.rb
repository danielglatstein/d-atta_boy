class InningsPlayers < ActiveRecord::Migration
  def change
    create_table :innings_players do |t|
      t.integer :inning_id
      t.integer :player_id
    end
  end
end
