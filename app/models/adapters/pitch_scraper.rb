module Adapters 
  class PitchScraper

    def create_pitches(at_bat_xml, at_bat_object)
      at_bat_xml.children.each do |pitch_xml|
        pitch_hash = get_pitch_hash(pitch_xml, at_bat_object)
        begin
          if pitch_hash[:nasty]
            pitch_object = Pitch.create(pitch_hash)
            create_pitch_children(pitch_xml, pitch_object)
          end
          rescue ActiveRecord::RecordNotUnique
        end
      end
    end
    
    def get_pitch_hash(pitch_xml, at_bat_object)
      hash = Hash.new
      hash[:at_bat_id] = at_bat_object.id
      pitch_hash = pitch_xml.each_with_object(hash) do |att, hash|
         case att[0]
         when "type"
           hash[:type] = att[1]
         when "pitch_type"
           hash[:pitch_type] = att[1]
         when "nasty"
           hash[:nasty] = att[1]
         end
      end 
    end

    def create_pitch_children(pitch_xml, pitch_object)
      baserunner_scraper = BaserunnerScraper.new
      movement_scraper = MovementScraper.new
      velocity_scraper = VelocityScraper.new
      release_point_scraper = ReleasePointScraper.new
      baserunner_scraper.create_baserunner(pitch_xml, pitch_object)
      movement_scraper.create_movement(pitch_xml, pitch_object)
      velocity_scraper.create_velocity(pitch_xml, pitch_object)
      release_point_scraper.create_release_point(pitch_xml, pitch_object)
    end
  end
end