# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  name_full  :string
#  name_brief :string
#  name       :string
#  code       :string
#  abbrev     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_and_belongs_to_many :players
end
