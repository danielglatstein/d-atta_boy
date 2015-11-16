# == Schema Information
#
# Table name: at_bats
#
#  id             :integer          not null, primary key
#  inning_id      :integer
#  pitcher_id     :integer
#  batter_id      :integer
#  outs           :integer
#  stand          :string
#  home_team_runs :integer
#  away_team_runs :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AtBat < ActiveRecord::Base
  belongs_to :inning
  has_many :pitches

  def matchups(pitcher_id, batter_id)
    AtBat.where(pitcher_id: pitcher_id, batter_id: batter_id)
  end

  def pitches_data
    self.pitches.each_with_object([]) do |pitch, arr|
      baserunner1 = Player.where(player_id: pitch.baserunner.on_1b).pluck(:last)[0]
      baserunner2 = Player.where(player_id: pitch.baserunner.on_2b).pluck(:last)[0]
      baserunner3 = Player.where(player_id: pitch.baserunner.on_3b).pluck(:last)[0]
      arr.push({result: pitch.result, type: pitch.pitch_type, nasty: pitch.nasty, on_1b: baserunner1, on_2b: baserunner2, on_3b: baserunner3, pfx_x: pitch.movement.pfx_x, pfx_z: pitch.movement.pfx_z, break_angle: pitch.movement.break_angle, break_length: pitch.movement.break_length, spin_rate: pitch.movement.spin_rate, start_speed: pitch.velocity.start_speed, end_speed: pitch.velocity.end_speed })
    end
  end

  def pitcher
    Player.find(self.pitcher_id)
  end

  def batter
    Player.find(self.batter_id)
  end

end
