class CreateReleasePoints < ActiveRecord::Migration
  def change
    create_table :release_points do |t|
      t.integer :pitch_id
      t.float :x0
      t.float :z0
      t.timestamps null: false
    end
  end
end
