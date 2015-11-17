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

  def self.matchups(pitcher_id, batter_id)
    at_bats = AtBat.where(pitcher_id: pitcher_id, batter_id: batter_id)
    at_bats.each_with_object([]) do |at_bat, arr|
      game = "#{at_bat.inning.home_team} vs. #{at_bat.inning.away_team}"
      inning = at_bat.inning.number
      result = at_bat.event
      date = at_bat.game_date[0..9]
      arr.push({game: game, inning: inning, result: result, date: date, at_bat_id: at_bat.id})
    end
  end

  def self.pitchers
    pitcher_ids = []
    AtBat.all.pluck(:pitcher_id).uniq
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

  def self.top_10_ops
    ascending_array = Player.all.sort_by {| player| player.ops }
    descending_array = ascending_array.reverse
    top_ten = descending_array[0..9]
    top_ten.each_with_object([]) do |player, array|
      full_name = "#{player.first} #{player.last}"
      hash = {name: full_name, ops: player.ops}
      array.push(hash)
    end
  end

  def batters_faced
    batter_ids = AtBat.where(pitcher_id: self.player_id).pluck(:batter_id).uniq
    batter_ids.each_with_object([]) do |batter, arr|
      player = Player.find_by(player_id: batter)
      name = "#{player.first} #{player.last}"
      arr.push({id: batter, name: name})
    end
  end

  def plate_appearances
    AtBat.where(batter_id: self.player_id)
  end

  def total_plate_appearances
    if plate_appearances
      plate_appearances.count.to_f
    else
      0.0000000
    end
  end

  def singles_total
    if plate_appearances
      plate_appearances.where(event: "Single").count.to_f
    else
      0.0000000
    end
  end

  def doubles_total
    if plate_appearances
      plate_appearances.where(event: "Double").count.to_f
    else
      0.0000000
    end
  end

  def triples_total
    if plate_appearances
      plate_appearances.where(event: "Triple").count.to_f
    else
      0.0000000
    end
  end

  def home_run_total
    if plate_appearances
      plate_appearances.where(event: "Home Run").count.to_f
    else
      0.0000000
    end
  end

  def walks_total
    if plate_appearances
      plate_appearances.where(event: "Walk").count.to_f
    else
      0.0000000
    end
  end

  def sac_fly_total
    if plate_appearances
      plate_appearances.where(event: "Sac Fly").count.to_f
    else
      0.000000
    end
  end

  def sac_bunt_total
    if plate_appearances
      plate_appearances.where(event: "Sac Bunt").count.to_f
    else
      0.000000
    end
  end

  def hbp_total
    if plate_appearances
      plate_appearances.where(event: "Hit By Pitch").count
    else
      0.0000000
    end
  end

  def sac_total
    sac_bunt_total + sac_fly_total
  end

  def total_hits
    hits = singles_total + doubles_total + triples_total + home_run_total
    hits
  end

  def total_bases
    total_bases = singles_total + (2 * doubles_total) + (3 * triples_total) + (4 * home_run_total)
    total_bases
  end

  def total_abs
    without_walks = total_plate_appearances - walks_total
    without_hbp = without_walks - hbp_total
    abs = without_hbp - sac_total
    abs
  end

  def slg
    slg = total_bases.to_f/total_abs.to_f
  end

  def obp
    top = (total_hits + walks_total + hbp_total)
    bottom = (total_abs + walks_total + sac_total + hbp_total)
    obp = top.to_f/bottom.to_f
  end

  def ops
    ops = slg + obp
    ops
  end

  def strike_out_total
    AtBat.where(pitcher_id: self.player_id, event: "Strikeout").count
  end

end
