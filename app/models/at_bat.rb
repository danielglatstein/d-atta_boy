# == Schema Information
#
# Table name: at_bats
#
#  id             :integer          not null, primary key
#  inning_id      :integer
#  outs           :integer
#  stand          :string
#  top_or_bottom  :string
#  home_team_runs :integer
#  away_team_runs :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AtBat < ActiveRecord::Base
  belongs_to :inning
  has_many :pitches
  has_and_belongs_to_many :players
end
