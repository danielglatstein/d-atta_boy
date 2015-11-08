module Adapters
  class MlbScraper

     def click_link(page, info)
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
        year = click_link(page, "2015")
        month = click_link(year, "10")
        binding.pry
        month.links[6..-1].each do |day_page_link|
          day_page = day_page_link.click
          game_page = click_link(day_page, "gid")
          inning_index = click_link(game_page, "inning")
          innings_page = click_link(inning_index, "all")
          game_scraper.update_or_create_games(innings_page)
        end
        month.links[6..-1].each do |day_page_link|
          day_page = day_page_link.click
          game_page = click_link(day_page, "gid")
          player_index = click_link(game_page, "players")
          player_scraper.update_or_create_games(player_index)
        end
     end

  end
end

