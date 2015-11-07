class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :player_id
      t.string :first
      t.string :last
      t.string :num
      t.string :rl
      t.string :bats
      t.string :position
      t.timestamps null: false
    end
  end
end
