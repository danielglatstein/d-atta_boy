class PlayersController < ApplicationController
  
  def index
    @players = Player.players
    gon.watch.players = @players
  end

end