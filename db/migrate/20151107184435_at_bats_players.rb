class AtBatsPlayers < ActiveRecord::Migration
  def change
    create_table :at_bats_players do |t|
      t.integer :at_bat_id
      t.integer :player_id
    end
  end
end
