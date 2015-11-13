module Adapters 
  class BaserunnerScraper

    def create_baserunner(pitch_xml, pitch_object)
      baserunner_hash = get_baserunner_hash(pitch_xml, pitch_object)
      begin
        baserunner_object = Baserunner.create(baserunner_hash)
        rescue ActiveRecord::RecordNotUnique
      end
    end
    
    def get_baserunner_hash(pitch_xml, pitch_object)
      #baserunner's columns only appear when their is a runner on that base, 
      #will these automatically be saved as nil? or will it blow up?
      hash = Hash.new
      hash[:pitch_id] = pitch_object.id
      baserunner_hash = pitch_xml.each_with_object(hash) do |att, hash|
         case att[0]
         when "on_1b"
           hash[:on_1b] = att[1]
         when "on_2b"
           hash[:on_2b] = att[1]
         when "on_3b"
           hash[:on_3b] = att[1]
         end
      end 
    end
  end
end

