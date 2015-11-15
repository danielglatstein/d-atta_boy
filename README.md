# d-atta_boy
11/7:
add scrape players.xml
encapsuplate steps of mlb_scraper.generate_pages into smaller method


methods needed:

Pitch.fastballs 
Pitch.sliders
Pitch.curveballs

11/15 to do: 

missing players from pirates, cardinals and rangers; 

create join table instances!
innings_players
  when an at_bat is created it has two players, we need to grab the pitcher and batter from every at bat and create_or_find a row of the join table with a matching inning_id and player_id
players_teams
  when players are created the players.xml page has a team_id, we need to find_or_create a row on the join table with that player_id and team_id
games_teams
  when a game is created there should be two new rows on the join table created with the team_code and game_id