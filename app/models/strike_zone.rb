# == Schema Information
#
# Table name: strike_zones
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

class StrikeZone < ActiveRecord::Base
  belongs_to :pitch
end
