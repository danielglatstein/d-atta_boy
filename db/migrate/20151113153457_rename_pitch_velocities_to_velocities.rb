class RenamePitchVelocitiesToVelocities < ActiveRecord::Migration
  def change
    rename_table :pitch_velocities, :velocities
  end
end
