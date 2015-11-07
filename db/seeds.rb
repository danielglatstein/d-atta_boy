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
Player.destroy_all

scraper = Adapters::MlbScraper.new
scraper.page_navigation

