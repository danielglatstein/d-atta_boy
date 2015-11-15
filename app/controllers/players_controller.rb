class PlayersController < ApplicationController
  def index
    @players = Player.players(params[:players_limit].to_i)
    gon.watch.players = @players
    respond_to do |format|
      format.html
      format.json { render :json => {:data => @players} }
    end
  end

end