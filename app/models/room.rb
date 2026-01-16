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
  validates :content, presence: true        # 施設詳細
  validates :money, presence: true, numericality: { greater_than_or_equal_to: 1 } # 料金
  validates :live, presence: true        # 住所
end
