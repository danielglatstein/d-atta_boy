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

require 'test_helper'

class AtBatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
