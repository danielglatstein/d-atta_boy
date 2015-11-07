# == Schema Information
#
# Table name: innings
#
#  id          :integer          not null, primary key
#  game_id     :integer
#  number      :string
#  away_team   :string
#  home_team   :string
#  next_inning :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Inning < ActiveRecord::Base
  belongs_to :game
  has_and_belongs_to_many :players
  has_many :at_bats
  has_many :pitches, through: :at_bats
end
