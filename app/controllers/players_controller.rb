class PlayersController < ApplicationController

  def matchups
    @matchups = Player.matchups(params[:pitcher_id], params[:batter_id])
    render :json => {matchups: @matchups}
  end

  def pitches_data
    @at_bat = AtBat.find(params[:at_bat_id])
    @pitches_data = @at_bat.pitches_data
    render :json => {pitches_data: @pitches_data}
  end

  def batters
    @pitcher = Player.find_by(player_id: params[:pitcher_id])
    @batters = @pitcher.batters_faced
    render :json => {batters: @batters}
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