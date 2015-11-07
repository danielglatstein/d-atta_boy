# == Schema Information
#
# Table name: baserunners
#
#  id         :integer          not null, primary key
#  pitch_id   :integer
#  on_1b      :boolean
#  on_2b      :boolean
#  on_3b      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Baserunner < ActiveRecord::Base
  belongs_to :pitch
end
