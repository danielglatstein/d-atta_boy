class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.integer :at_bat_id
      t.string :result
      t.integer :nasty
      t.timestamps null: false
    end
  end
end
