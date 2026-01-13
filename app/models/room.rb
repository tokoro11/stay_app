# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  money      :integer
#  live       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Room < ApplicationRecord
  has_one_attached :image
  has_many :checks
  validates :title, presence: true
end
