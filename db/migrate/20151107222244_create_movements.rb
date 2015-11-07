class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.integer :pitch_id
      t.float :pfx_x
      t.float :pfx_z
      t.float :break_angle
      t.float :break_length
      t.float :spin_rate
      t.timestamps null: false
    end
  end
end
