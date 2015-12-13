class AtBatsController < ApplicationController 
  def at_bat_pitches_data
    at_bat = AtBat.find(params[:at_bat_id])
    @pitches_data = at_bat.at_bat_pitches
    render :json => {pitches_data: @pitches_data}
  end
end


