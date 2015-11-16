module Adapters 
  class PlayerScraper 

    def players(page)
      open(page.uri).read
    end

    def get_players(xml_page)
      Nokogiri::XML(xml_page)
    end

    def create_players(page)
      player = Player.create
      xml_players = players(page)
      xml_page = get_players(xml_players)
      xml_page.xpath("//player").each do |player|
        player_hash = get_player_hash(player)
        player_id = player_hash[:player_id].to_i
        player = Player.find_or_create_by(player_id: player_id)
        player.update(player_hash)
        player.save
      end
    end

    def get_player_hash(player_xml)
      hash = Hash.new
      player_hash = player_xml.each_with_object(hash) do |att, hash|
        case att[0]
        when "id"
          hash[:player_id] = att[1]
        when "first"
          hash[:first] = att[1]
        when "last"
          hash[:last] = att[1]
        when "num"
          hash[:num] = att[1]
        when "rl"
          hash[:rl] = att[1]
        when "bats"
         hash[:bats] = att[1]
        when "position"
         hash[:position] = att[1]
        end
      end
    end
  end
end

      