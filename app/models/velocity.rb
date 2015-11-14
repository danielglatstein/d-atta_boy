# == Schema Information
#
# Table name: velocities
#
#  id          :integer          not null, primary key
#  pitch_id    :integer
#  start_speed :float
#  end_speed   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Velocity < ActiveRecord::Base
  belongs_to :pitch
end
