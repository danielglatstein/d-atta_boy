module Adapters 
  class AtBatScraper

    def create_at_bats(inning_xml, inning_object)
      pitch_scraper = PitchScraper.new
      inning_xml.children.each do |t_or_b_xml|
        t_or_b_xml.children.each do |at_bat_xml|
          at_bat_hash = get_at_bat_hash(at_bat_xml, inning_object)
          at_bat_object = AtBat.create(at_bat_hash)
          inning_object.at_bats << at_bat_object
          pitch_scraper.create_pitches(at_bat_xml, at_bat_object)
        end
      end
    end
    
    def get_at_bat_hash(at_bat_xml, inning_object)
      hash = Hash.new
      hash[:inning_id] = inning_object.id
      at_bat_hash = at_bat_xml.each_with_object(hash) do |att, hash|
        case att[0]
        when "o"
          hash[:outs] = att[1]
        when "event"
          hash[:event] = att[1]
        when "stand"
          hash[:stand] = att[1]
        when "home_team_runs"
          hash[:home_team_runs] = att[1]
        when "away_team_runs"
          hash[:away_team_runs] = att[1]
        when "pitcher"
          hash[:pitcher_id] = att[1]
        when "batter"
          hash[:batter_id] = att[1]
        end
      end
    end

  end
end