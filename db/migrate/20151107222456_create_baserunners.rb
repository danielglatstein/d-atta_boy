class CreateBaserunners < ActiveRecord::Migration
  def change
    create_table :baserunners do |t|
      t.integer :pitch_id
      t.boolean :on_1b
      t.boolean :on_2b
      t.boolean :on_3b
      t.timestamps null: false
    end
  end
end
