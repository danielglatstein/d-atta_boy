module Adapters 
  class PitchScraper
    
    def get_pitch_hash(pitch, at_bat)
      hash = Hash.new
      movement_hash = pitch.each_with_object(hash) do |att, hash|
         case att[0]
         when "type"
           hash[type] = att[1]
         when "pitch_type"
           hash[pitch_type] = att[1]
         when "nasty"
           hash[nasty] = att[1]
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

    def get_movement_hash(pitch)
      hash = Hash.new
      movement_hash = pitch.each_with_object(hash) do |att, hash|
         case att[0]
         when "pfx_x"
           hash[pfx_x] = att[1]
         when "pfx_z"
           hash[pfx_z] = att[1]
         when "break_angle"
           hash[break_angle] = att[1]
         when "break_length"
           hash[break_length] = att[1]
         when "spin_rate"
           hash[spin_rate] = att[1]
         end
      end 
    end

    def get_velocity_hash(pitch)
      hash = Hash.new
      movement_hash = pitch.each_with_object(hash) do |att, hash|
         case att[0]
         when "start_speed"
           hash[start_speed] = att[1]
         when "end_speed"
           hash[end_speed] = att[1]
         end
      end 
    end

    # def update_or_create_pitches(wutang)
    #   binding.pry
    #   get_pitches_data_array.each do |pitch|
    #     new_pitch = Pitch.new(pitch)
    #     new_pitch.id = pitch[:id]
    #     new_pitch.save
    #   end
    # end

  end
end