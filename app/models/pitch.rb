# == Schema Information
#
# Table name: pitches
#
#  id         :integer          not null, primary key
#  at_bat_id  :integer
#  type       :string
#  pitch_type :string
#  nasty      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pitch < ActiveRecord::Base
  belongs_to :at_bat

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
  
  def players
    {:batter_id => batter, :pitcher_id => pitcher}
  end

end
