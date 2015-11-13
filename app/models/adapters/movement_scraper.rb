module Adapters 
  class MovementScraper

    def create_movement(pitch_xml, pitch_object)
      movement_hash = get_movement_hash(pitch_xml, pitch_object)
      begin
        movement_object = Movement.create(movement_hash)
        rescue ActiveRecord::RecordNotUnique
      end
    end
    
    def get_movement_hash(pitch_xml, pitch_object)
      hash = Hash.new
      hash[:pitch_id] = pitch_object.id
      movement_hash = pitch_xml.each_with_object(hash) do |att, hash|
        case att[0]
        when "pfx_x"
          hash[:pfx_x] = att[1]
        when "pfx_z"
          hash[:pfx_z] = att[1]
        when "break_angle"
          hash[:break_angle] = att[1]
        when "break_length"
          hash[:break_length] = att[1]
        when "spin_rate"
          hash[:spin_rate] = att[1]
        end
      end 
    end
  end
end