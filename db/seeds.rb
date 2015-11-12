# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Game.destroy_all
Inning.destroy_all
AtBat.destroy_all
Pitch.destroy_all
Team.destroy_all
Player.destroy_all

scraper = Adapters::MlbScraper.new
scraper.page_navigation

Team.create( :code => "nya",  :abbrev => "NYY", :team_id => "147", :name => "NY Yankees", :name_full => "New York Yankees", :name_brief => "Yankees")

Team.create( :code => "hou",  :abbrev => "HOU", :team_id => "117", :name => "Houston", :name_full => "Houston Astros", :name_brief => "Astros")

Team.create( :code => "pit",  :abbrev => "PIT", :team_id => "134", :name => "Pittsburgh", :name_full => "Pittsburgh Pirates", :name_brief => "Pirates")

Team.create( :code => "chn",  :abbrev => "CHC", :team_id => "112", :name => "Chi Cubs", :name_full => "Chicago Cubs", :name_brief => "Cubs")

Team.create( :code => "kca",  :abbrev => "KC",  :team_id => "118", :name => "Kansas City", :name_full => "Kansas City Royals", :name_brief => "Royals")

Team.create( :code => "tor",  :abbrev => "TOR", :team_id => "141", :name => "Toronto", :name_full => "Toronto Blue Jays", :name_brief => "Blue Jays" )

Team.create( :code => "tex",  :abbrev => "TEX", :team_id => "140", :name => "Texas", :name_full => "Texas Rangers", :name_brief => "Rangers")

Team.create( :code => "lan",  :abbrev => "LAD", :team_id => "119", :name => "LA Dodgers", :name_full => "Los Angeles Dodgers", :name_brief => "Dodgers")

Team.create( :code => "nyn",  :abbrev => "NYM", :team_id => "121", :name => "NY Mets", :name_full => "New York Mets", :name_brief => "Mets")

Team.create( :code => "sln",  :abbrev => "STL", :team_id => "138", :name => "St. Louis", :name_full => "St. Louis Cardinals", :name_brief => "Cardinals")

