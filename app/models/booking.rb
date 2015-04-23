class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :chalet

  validates :user, presence: true
  validates :chalet, presence: true
  validates :arrive_on, presence: true
  validates :leave_on, presence: true
  validates :total_price, presence: true, numericality: true
  validate :arrive_in_future?
  validate :leave_after_arrive?

  def arrive_in_future?
    if arrive_on < Date.current
      errors.add(:arrive_on, 'Arrival date must be in the future')
    end
  end

  def leave_after_arrive?
    if leave_on < arrive_on
      errors.add(:leave_on, 'Leaving date must be after arrival date')
    end
  end

end
