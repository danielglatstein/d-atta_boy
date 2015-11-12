module Adapters 
  class PlayerScraper 

    def players(page)
      open(page.uri).read
    end
    def get_players(xml_page)
      Nokogiri::XML(xml_page)
    end
    def update_or_create_players(page)
      player = Player.create
      xml_players = players(page)
      xml_page = get_players(xml_players)
      xml_page.xpath("//player").each do |player|
        Player.find_or_create_by(player)
      end
    end

  end
end

