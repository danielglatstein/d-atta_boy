class PitchesController < ApplicationController
  before_action :set_pitch, only: [:show, :edit, :update, :destroy]

  def index
    @pitcher = Player.find_by(player_id: params[:pitcher_id])
    @pitches = @pitcher.pitches
    
    respond_to do |format|
      format.html
      format.json { render :json => {pitches: @pitches} }
    end
  end

  private
    def set_pitch
      @pitch = Pitch.find(params[:id])
    end

    def pitch_params
      params[:pitch]
    end
end
