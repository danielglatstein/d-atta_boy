module Adapters 
  class ReleasePointScraper

    def create_release_point(pitch_xml, pitch_object)
      release_point_hash = get_release_point_hash(pitch_xml, pitch_object)
      begin
        release_point_object = ReleasePoint.create(release_point_hash)
        rescue ActiveRecord::RecordNotUnique
      end
    end
    
    def get_release_point_hash(pitch_xml, pitch_object)
      hash = Hash.new
      hash[:pitch_id] = pitch_object.id
      release_point_hash = pitch_xml.each_with_object(hash) do |att, hash|
        case att[0]
        when "x0"
          hash[:x0] = att[1]
        when "z0"
          hash[:z0] = att[1]
        end
      end 
    end
  end
end