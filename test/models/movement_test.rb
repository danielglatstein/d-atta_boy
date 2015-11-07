# == Schema Information
#
# Table name: movements
#
#  id           :integer          not null, primary key
#  pitch_id     :integer
#  pfx_x        :float
#  pfx_z        :float
#  break_angle  :float
#  break_length :float
#  spin_rate    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class MovementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
