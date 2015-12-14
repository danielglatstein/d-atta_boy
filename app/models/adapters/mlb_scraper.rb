module Adapters
  class MlbScraper

    def click_link_on(page, info)
      link = page.links.select {|link|link.text.include?(info)}[0]
      link.click
    end

    def page_navigation
      mechanize = Mechanize.new
      page = mechanize.get("http://gd2.mlb.com/components/game/mlb/")
      navigate_through_years(page, 2015, 2015, 10, 10, 5, -1)
    end

    def navigate_through_years(page, first_year=2015, final_year=2015, first_month=4, final_month=11, first_day=1, last_day=-1)
      (first_year..final_year).each do |year|
        year = click_link_on(page, year.to_s)
        (first_month..final_month).each do |month|
          month = click_link_on(year, month.to_s)
          navigate_through_month(month, first_day, last_day) do |game_page| 
            unless game_page.links[-1].text == " preview.plist"
              navigate_through_innings(game_page)
              navigate_through_players(game_page)
            end
          end
        end
      end
    end

    def navigate_through_month(month, first_day, last_day)
      month.links[first_day..last_day].each do |day_page_link|
        day_page = day_page_link.click
        day_page.links.each do |day_link|
          if day_link.text.include?("gid")
            game_page = day_link.click
            yield(game_page)
          end
        end
      end
    end

    def navigate_through_innings(game_page)
      game_scraper = GameScraper.new
      begin
        inning_index = click_link_on(game_page, "inning")
        innings_page = click_link_on(inning_index, "all")
      rescue => error
        binding.pry
      end
      game_scraper.create_games(innings_page)
    end

    def navigate_through_players(game_page) 
      player_scraper = PlayerScraper.new
      player_index = click_link_on(game_page, "players")
      player_scraper.create_players(player_index)
    end
  end
end

