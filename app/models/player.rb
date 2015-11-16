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

  def self.top_5_home_run_hitters
    ascending_array = Player.all.sort_by {| player| player.home_run_total }
    descending_array = ascending_array.reverse
    top_ten = descending_array[0..9]
    top_ten.each_with_object([]) do |player, array|
      full_name = "#{player.first} #{player.last}"
      hash = {name: full_name, home_runs: player.home_run_total}
      array.push(hash)
    end
  end

  def self.top_5_stike_out_pitchers
    ascending_array = Player.all.sort_by {| player| player.strike_out_total }
    descending_array = ascending_array.reverse
    top_ten = descending_array[0..9]
    top_ten.each_with_object([]) do |player, array|
      full_name = "#{player.first} #{player.last}"
      hash = {name: full_name, strike_outs: player.strike_out_total}
      array.push(hash)
    end
  end

  def plate_appearances
    AtBat.where(batter_id: self.player_id)
  end

  def home_run_total
    plate_appearances.where(event: "Home Run").count
  end

  def batters_faced
    AtBat.where(pitcher_id: self.player_id)
  end

  def strike_out_total
    batters_faced.where(event: "Strikeout").count
  end

end
