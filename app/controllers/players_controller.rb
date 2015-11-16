class PlayersController < ApplicationController
  def index
    @players = Player.players(params[:players_limit].to_i)
    gon.watch.players = @players
    respond_to do |format|
      format.html
      format.json { render :json => {:data => @players} }
    end
  end

  def strikeout_leaders
    @rankings = Player.top_5_stike_out_pitchers
    respond_to do |format|
      format.html
      format.json {render :json => {:rankings => @rankings}}
    end
  end

  def home_run_leaders
    @rankings = Player.top_5_home_run_hitters
    respond_to do |format|
      format.html
      format.json {render :json => {:rankings => @rankings}}
    end
  end
end