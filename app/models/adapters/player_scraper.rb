require 'open-uri'

module Adapters 
  class PlayerScraper 

    def players(page)
      open(page.uri).read
    end
    def get_players(xml_page)
      binding.pry
      xml_doc  = Nokogiri::XML(xml_page).xpath("//game") 
    end
    def update_or_create_players(page)
      player = Player.create
      xml_players = players(page)
      binding.pry
      xml_page = get_players(xml_players)
      xml_page.xpath("//inning").each do |inning|
        Player.find_or_create_by()
      end
    end

  end
end
