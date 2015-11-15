class PitchesController < ApplicationController
  before_action :set_pitch, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pitches = Pitch.all
    respond_with(@pitches)
  end


  private
    def set_pitch
      @pitch = Pitch.find(params[:id])
    end

    def pitch_params
      params[:pitch]
    end
end
