# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  first      :string
#  last       :string
#  num        :string
#  rl         :string
#  bats       :string
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ActiveRecord::Base

  # def self.pitchers
  #   Pitcher.where()
  # end

  def self.players(limit)
    unless limit > 0
      limit = 5
    end
    Player.order(:last).limit(limit).pluck(:first, :last)
  end

  def plate_appearances
    AtBat.where(batter_id: self.player_id)
  end

  def batters_faced
    AtBat.where(player_id: self.player_id)
  end

end
