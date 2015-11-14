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

class Baserunner < ActiveRecord::Base
  belongs_to :pitch
end
