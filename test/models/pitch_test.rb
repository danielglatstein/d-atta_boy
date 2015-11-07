# == Schema Information
#
# Table name: pitches
#
#  id         :integer          not null, primary key
#  at_bat_id  :integer
#  type       :string
#  pitch_type :string
#  nasty      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PitchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
