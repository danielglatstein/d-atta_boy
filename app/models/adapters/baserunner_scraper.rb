module Adapters 
  class BaserunnerScraper

    def create_baserunners(at_bat)
      at_bat.children.each do |pitch|
        pitch_hash = pitch_scraper.get_pitch_hash(pitch, at_bat)
        begin
          if pitch_hash[:break_angle]
            new_pitch_obj = pitch_scraper.update_or_create_pitches(pitch_hash)
            new_pitch_obj.at_bat_id = new_at_bat_obj.id
            new_pitch_obj.save
          end
          rescue ActiveRecord::RecordNotUnique
        end
      end
    end
    
    def get_baserunner_hash(pitch)
      #baserunner's columns only appear when their is a runner on that base, 
      #will these automatically be saved as nil? or will it blow up?
      hash = Hash.new
      baserunner_hash = pitch.each_with_object(hash) do |att, hash|
         case att[0]
         when "on_1b"
           hash[on_1b] = att[1]
         when "on_2b"
           hash[on_2b] = att[1]
         when "on_3b"
           hash[on_3b] = att[1]
         end
      end 
    end
  end
end

