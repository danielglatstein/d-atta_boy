# == Schema Information
#
# Table name: pitches
#
#  id         :integer          not null, primary key
#  at_bat_id  :integer
#  result     :string
#  pitch_type :string
#  nasty      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pitch < ActiveRecord::Base
  belongs_to :at_bat
  has_one :baserunner
  has_one :movement
  has_one :release_point
  has_one :strike_zone
  has_one :velocity

  def inning
    self.atbat.inning
  end

  def game
    self.inning.game
  end

  def batter
    self.atbat.batter_id
  end

  def pitcher
    self.atbat.pitcher_id
  end
  
  def pitches(pitcher_id)
    AtBat.where(pitcher_id: pitcher_id).each_with_object({}) do |at_bat, hash|
      pitches = at_bat.pitches
    end
  end

end
