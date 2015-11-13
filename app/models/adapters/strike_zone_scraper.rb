module Adapters 
  class StrikeZoneScraper

    def create_strike_zone(pitch_xml, pitch_object)
      strike_zone_hash = get_strike_zone_hash(pitch_xml, pitch_object)
      begin
        strike_zone_object = StrikeZone.create(strike_zone_hash)
        rescue ActiveRecord::RecordNotUnique
      end
    end
    
    def get_strike_zone_hash(pitch_xml, pitch_object)
      hash = Hash.new
      hash[:pitch_id] = pitch_object.id
      strike_zone_hash = pitch_xml.each_with_object(hash) do |att, hash|
        case att[0]
        when "x"
          hash[:x] = att[1]
        when "y"
          hash[:y] = att[1]
        when "px"
          hash[:px] = att[1]
        when "pz"
          hash[:pz] = att[1]
        when "sz_top"
          hash[:sz_top] = att[1]
        when "sz_bot"
          hash[:sz_bot] = att[1]
        end
      end 
    end
  end
end