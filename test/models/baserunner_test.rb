# == Schema Information
#
# Table name: baserunners
#
#  id         :integer          not null, primary key
#  pitch_id   :integer
#  on_1b      :integer
#  on_2b      :integer
#  on_3b      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BaserunnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
