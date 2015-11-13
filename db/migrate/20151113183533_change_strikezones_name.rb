class ChangeStrikezonesName < ActiveRecord::Migration
  def change
    rename_table :strikezones, :strike_zones
  end
end
