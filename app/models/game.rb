# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :innings
  has_many :at_bats, through: :innings

  def date
    date = self.at_bats.first.game_date
    parsed = DateTime.parse(date)
    parsed
  end

  def home_name
    home_code = self.innings.first.home_team
    home_obj = Team.where(code: home_code) 
    home_obj[0].name_brief
  end

  def away_name
    away_code = self.innings.first.away_team
    away_obj = Team.where(code: away_code)
    away_obj[0].name_brief
  end

  def away_score
    self.at_bats.last.away_team_runs
  end

  def home_score
    self.at_bats.last.home_team_runs
  end
end
