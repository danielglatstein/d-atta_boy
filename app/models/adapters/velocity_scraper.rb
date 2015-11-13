module Adapters 
  class VelocityScraper

    def create_velocity(pitch_xml, pitch_object)
      velocity_hash = get_velocity_hash(pitch_xml, pitch_object)
      begin
        velocity_object = Velocity.create(velocity_hash)
        rescue ActiveRecord::RecordNotUnique
      end
    end
    
    def get_velocity_hash(pitch_xml, pitch_object)
      hash = Hash.new
      hash[:pitch_id] = pitch_object.id
      velocity_hash = pitch_xml.each_with_object(hash) do |att, hash|
        case att[0]
        when "start_speed"
          hash[start_speed] = att[1]
        when "end_speed"
          hash[end_speed] = att[1]
        end
      end 
    end
  end
end