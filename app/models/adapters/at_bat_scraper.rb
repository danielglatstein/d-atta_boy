module Adapters 
  class AtBatScraper
    
    def get_at_bat_hash(at_bat, inning)
      hash = Hash.new
      # hash[:home_team_runs] = nil
      # hash[:away_team_runs] = nil
      at_bat_hash = at_bat.each_with_object(hash) do |att, hash|
        case att[0]
        when "o"
          hash[:outs] = att[1]
        when "stand"
          hash[:stand] = att[1]
        when "home_team_runs"
          hash[:home_team_runs] = att[1]
        when "away_team_runs"
          hash[:away_team_runs] = att[1]
        end
      end
    end

  end
end