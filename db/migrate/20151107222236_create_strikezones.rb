class CreateStrikezones < ActiveRecord::Migration
  def change
    create_table :strike_zones do |t|
      t.integer :pitch_id
      t.float :x
      t.float :y
      t.float :px
      t.float :pz
      t.float :sz_top
      t.float :sz_bot
      t.integer :zone
      t.timestamps null: false
    end
  end
end
