class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :people, numericality: { only_integer: true, greater_than: 0 }

  validate :start_at_is_future
  validate :end_at_after_start_at

  private

  def start_at_is_future
    if start_at.present? && start_at < Date.today
      errors.add(:start_at, "は今日以降にしてください")
    end
  end

  def end_at_after_start_at
    if start_at.present? && end_at.present? && end_at <= start_at
      errors.add(:end_at, "はチェックイン後の日付にしてください")
    end
  end
end
