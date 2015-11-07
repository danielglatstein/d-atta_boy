class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :name_full
      t.string :name_brief
      t.string :name
      t.string :code #this is what will be the matching id on the games_teams join table
      t.string :abbrev
      t.timestamps null: false
    end
  end
end
