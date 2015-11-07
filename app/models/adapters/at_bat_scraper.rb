module Adapters 
  class AtBatScraper
    def innings
      open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
    end
    
    def get_at_bats
      xml_doc  = Nokogiri::XML(innings).xpath("//atbat")
    end
    def get_at_bat_hash(at_bat)
      hash = Hash.new
      hash[:home_team_runs] = nil
      hash[:away_team_runs] = nil
      at_bat_hash = at_bat.each_with_object(hash) do |att, hash|
        case att[0]
        when "num"
          hash[:at_bat_num] = att[1]
        when "b"
          hash[:balls] = att[1]
        when "s"
          hash[:strikes] = att[1]
        when "o"
          hash[:outs] = att[1]
        when "start_tfs_zulu"
          hash[:start_tfs_zulu] = att[1]
        when "batter"
          hash[:batter_id] = att[1]
        when "stand"
          hash[:stand] = att[1]
        when "b_height"
          hash[:b_height] = att[1]
        when "pitcher"
          hash[:pitcher_id] = att[1]
        when "p_throws"
          hash[:p_throws] = att[1]
        when "des"
          hash[:description] = att[1]
        when "home_team_runs"
          hash[:home_team_runs] = att[1]
        when "away_team_runs"
          hash[:away_team_runs] = att[1]
        end
      end
    end
    def update_or_create_at_bats
      get_at_bats_data_array.each do |at_bat|
        new_at_bat = AtBat.create(at_bat)
      end
    end
  end
end