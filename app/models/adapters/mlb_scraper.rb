module Adapters
  class MlbScraper

     def page_navigation
      game_scraper = GameScraper.new
      mechanize = Mechanize.new
      main_page = mechanize.get("http://gd2.mlb.com/components/game/mlb/")
      main_page.links.each do |year_link|
        if year_link.text.include?("2015")
          year_page = year_link.click
          year_page.links.each do |month_link|
            if month_link.text.include?("10")
              month_page = month_link.click
              month_page.links[6..-1].each do |day_page_link|
                day_page = day_page_link.click
                day_page.links.each do |day_data|
                  if day_data.text.include?("gid")
                    game_page = day_data.click
                    game_page.links.each do |game_data_link|
                      if game_data_link.text.include?("inning")
                        inning_page = game_data_link.click
                        inning_page.links.each do |all_innings|
                          if all_innings.text.include?("all")
                            all_innings_page = all_innings.click
                            trying = game_scraper.update_or_create_games(all_innings_page)
                            binding.pry
                          end
                        end
                      elsif game_data_link.text.include?("players")

                      end
                    end
                  elsif day_data.text.include?("batters") #fix to be batters
                    all_batters_page = day_data.click
                    all_batters_page.links.each do |batter_link|
                      # if batter_link.text.include?("1")
                      #   batter_page = batter_link.click
                      #   batter = open("#{batter_page.uri}").read
                      #   xml_doc  = Nokogiri::XML(batter).xpath("//batting")
                      #   batter_id = batter_page.uri.path[-12..-7]
                      #   batter = Batter.find_or_create_by(id: batter_id)
                      #   batter_game_stats = BatterGameStats.new
                      # end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
