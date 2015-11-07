# == Schema Information
#
# Table name: pitch_velocities
#
#  id          :integer          not null, primary key
#  pitch_id    :integer
#  start_speed :float
#  end_speed   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PitchVelocityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
