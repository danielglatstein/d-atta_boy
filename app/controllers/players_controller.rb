class PlayersController < ApplicationController
  def index
    if params[:players_limit]
      @players = Player.players(params[:players_limit].to_i)
    end

    if params[:at_bat_id]
      @at_bat = AtBat.find(params[:at_bat_id])
      @pitches_data = @at_bat.pitches_data 
    end
    
    if params[:pitcher_id]
      @pitcher = Player.find_by(player_id: params[:pitcher_id])
      @batters = @pitcher.batters_faced
    end

    if params[:pitcher_id] && params[:batter_id]
      @matchups = Player.matchups(params[:pitcher_id], params[:batter_id])
    end
    # @players = Player.players(params[:players_limit].to_i)
    # gon.watch.players = @players
    respond_to do |format|
      format.html
      format.json { render :json => {data: @players, batters: @batters, matchups: @matchups, pitches_data: @pitches_data} }
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

  def ops_leaders
    @rankings = Player.top_10_ops
    respond_to do |format|
      format.html
      format.json {render :json => {:rankings => @rankings}}
    end
  end
end