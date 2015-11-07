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

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
