# == Schema Information
#
# Table name: checks
#
#  id         :integer          not null, primary key
#  check_date :string
#  name       :string
#  start_at   :datetime
#  end_at     :datetime
#  note       :string
#  use_date   :integer
#  money      :integer
#  people     :integer
#  totalmoney :integer
#  room_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_checks_on_room_id  (room_id)
#
# Foreign Keys
#
#  room_id  (room_id => rooms.id)
#
class Check < ApplicationRecord
  belongs_to :room
end
