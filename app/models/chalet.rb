class Chalet < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :city, presence: true
  validates :daily_price, presence: true, numericality: true
  validates :max_nb_of_guests, presence: true, numericality: true
end
