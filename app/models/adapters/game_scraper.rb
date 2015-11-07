require 'open-uri'

module Adapters 
  class GameScraper 

    def innings(page)
      open(page.uri).read
    end
    def get_game(xml_page)
      xml_doc  = Nokogiri::XML(xml_page).xpath("//game")
    end
    def update_or_create_games(page)
      at_bat_scraper = AtBatScraper.new
      pitch_scraper = PitchScraper.new
      game = Game.create
      xml_innings = innings(page)
      xml_page = get_game(xml_innings)
      xml_page.xpath("//inning").each do |inning|
        new_inning_obj = Inning.find_or_create_by(number: inning.values[0], away_team: inning.values[1], home_team: inning.values[2], next_inning: inning.values[3])
        game.innings << new_inning_obj
        inning.children.each do |t_or_b|
          t_or_b.children.each do |at_bat|
            at_bat_hash = at_bat_scraper.get_at_bat_hash(at_bat)
            new_at_bat_obj = AtBat.find_or_create_by(at_bat_hash)
            new_at_bat_obj.top_or_bottom = t_or_b.name
            new_inning_obj.at_bats << new_at_bat_obj
            at_bat.children.each do |pitch|
              pitch_hash = pitch_scraper.get_pitch_hash(pitch, at_bat)
              begin
                if pitch_hash[:break_angle]
                  new_pitch_obj = Pitch.create(pitch_hash)
                  new_pitch_obj.at_bat_id = new_at_bat_obj.id
                  new_pitch_obj.save
                end
                rescue ActiveRecord::RecordNotUnique
              end
            end
          end
        end
      end
    end
  end
end