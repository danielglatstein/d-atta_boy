module Adapters 
  class PitchScraper
    def innings
      open("http://gd2.mlb.com/components/game/mlb/year_2014/month_05/day_18/gid_2014_05_18_pitmlb_nyamlb_1/inning/inning_all.xml").read
    end
    
    def get_at_bats
      xml_doc  = Nokogiri::XML(innings).xpath("//atbat")
    end
    def get_pitch_hash(pitch, at_bat)
      pitch_hash = pitch.each_with_object({}) do |att, hash|
        if att[0] == "type" 
          hash["result"] = att[1]
        else
          hash[att[0].to_sym] = att[1..-1].join("_")
        end
        hash[:batter_id] = at_bat.values[6]
        hash[:pitcher_id] = at_bat.values[9]
        hash[:at_bat_num] = at_bat.values[0]
        hash.delete(:id)
        hash.delete(:event_num)
      end
    end
    def update_or_create_pitches
      get_pitches_data_array.each do |pitch|
        new_pitch = Pitch.new(pitch)
        new_pitch.id = pitch[:id]
        new_pitch.save
      end
    end
    def iterate_through_pages
      mechanize = Mechanize.new
      mlb_root = mechanize.get("http://gd2.mlb.com/components/game/mlb/")
      year_links = ""
      month_links = ""
      day_links = ""
      innings_link = ""
    end
  end
end