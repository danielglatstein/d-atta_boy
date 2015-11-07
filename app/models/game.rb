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
end
