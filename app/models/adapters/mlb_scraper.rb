module Adapters
  class MlbScraper

     def click_link_on(page, info)
        page.links.each do |link|
          if link.text.include?(info)
            page = link.click
          end
        end
        page
     end

     def page_navigation
        player_scraper = PlayerScraper.new
        game_scraper = GameScraper.new
        mechanize = Mechanize.new
        page = mechanize.get("http://gd2.mlb.com/components/game/mlb/")
        year = click_link_on(page, "2015")
        month = click_link_on(year, "10")
        month.links[6..-1].each do |day_page_link|
          day_page = day_page_link.click
          day_page.links.each do |day_link|
            if day_link.text.include?("gid")
              game_page = day_link.click
              inning_index = click_link_on(game_page, "inning")
              innings_page = click_link_on(inning_index, "all")
              game_scraper.create_games(innings_page)
            end
          end
        end
        month.links[6..-1].each do |day_page_link|
          day_page = day_page_link.click
          day_page.links.each do |day_link|
            if day_link.text.include?("gid")
              game_page = day_link.click
              player_index = click_link_on(game_page, "players")
              player_scraper.create_players(player_index)
            end
          end
        end
     end

  end
end

