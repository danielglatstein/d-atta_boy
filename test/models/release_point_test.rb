# == Schema Information
#
# Table name: release_points
#
#  id         :integer          not null, primary key
#  pitch_id   :integer
#  x0         :float
#  z0         :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReleasePointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
