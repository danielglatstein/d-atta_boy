module Adapters 
  class InningScraper 


    def get_inning_hash(inning, game)
      hash = Hash.new
      hash[:game_id] = game.id
      inning.each_with_object(hash) do |att, hash|
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

