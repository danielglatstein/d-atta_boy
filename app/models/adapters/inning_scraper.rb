module Adapters 
  class InningScraper 

    def create_innings(game_xml, game_object)
      at_bat_scraper = AtBatScraper.new
      game_xml.xpath("//inning").each do |inning_xml|
        inning_obj = Inning.find_or_create_by(get_inning_hash(inning_xml, game_object))
        game_object.innings << new_inning_obj
        at_bat_scraper.create_at_bats(inning_xml, inning_obj)
      end
    end

    def get_inning_hash(inning_xml, game_object)
      hash = Hash.new
      hash[:game_id] = game_object.id
      inning_xml.each_with_object(hash) do |att, hash|
        case att[0]
        when "away_team"
          hash[:away_team] = att[1]
        when "home_team"
          hash[:home_team] = att[1]
        when "num"
          hash[:number] = att[1]
        when "next"
          hash[:next_inning] = att[1]
        end
      end
    end
  end
end

