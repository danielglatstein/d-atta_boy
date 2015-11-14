class CreateVelocities < ActiveRecord::Migration
  def change
    create_table :velocities do |t|
      t.integer :pitch_id
      t.float :start_speed
      t.float :end_speed
      t.timestamps null: false
    end
  end
end
