module Adapters 
  class AtBatScraper

    def create_at_bats(inning)
      inning.children.each do |t_or_b|
          t_or_b.children.each do |at_bat|
            at_bat_hash = at_bat_scraper.get_at_bat_hash(at_bat, inning)
            new_at_bat_obj = AtBat.find_or_create_by(at_bat_hash)
            new_at_bat_obj.top_or_bottom = t_or_b.name
            new_inning_obj.at_bats << new_at_bat_obj
          end
        end
      end
    end
    
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