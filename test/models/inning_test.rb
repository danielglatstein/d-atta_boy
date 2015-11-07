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

require 'test_helper'

class InningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
