class CreateBaserunners < ActiveRecord::Migration
  def change
    create_table :baserunners do |t|
      t.integer :pitch_id
      t.integer :on_1b
      t.integer :on_2b
      t.integer :on_3b
      t.timestamps null: false
    end
  end
end
