require 'open-uri'

module Adapters 
  class GameScraper 
    def innings(page)
      open(page.uri).read
    end

    def get_game(xml_page)
      Nokogiri::XML(xml_page).xpath("//game")
    end

    def create_games(page)
      game = Game.create
      inning_scraper = InningScraper.new
      xml_innings = innings(page)
      xml_page = get_game(xml_innings)
      inning_scraper.create_innings(game, xml_page)
    end
  end
end