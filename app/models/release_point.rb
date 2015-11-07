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

class ReleasePoint < ActiveRecord::Base
  belongs_to :pitch
end
