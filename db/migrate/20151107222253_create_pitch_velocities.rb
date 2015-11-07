class CreatePitchVelocities < ActiveRecord::Migration
  def change
    create_table :pitch_velocities do |t|
      t.integer :pitch_id
      t.float :start_speed
      t.float :end_speed
      t.timestamps null: false
    end
  end
end
