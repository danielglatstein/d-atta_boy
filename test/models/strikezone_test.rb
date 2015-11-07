# == Schema Information
#
# Table name: strikezones
#
#  id         :integer          not null, primary key
#  pitch_id   :integer
#  x          :float
#  y          :float
#  px         :float
#  pz         :float
#  sz_top     :float
#  sz_bot     :float
#  zone       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StrikezoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
