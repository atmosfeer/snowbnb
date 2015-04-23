class Chalet < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :chalet_pictures, dependent: :destroy

  accepts_nested_attributes_for :chalet_pictures, reject_if: lambda { |c| c['picture'].nil? }

  validates :title, presence: true, uniqueness: true
  validates :city, presence: true
  validates :daily_price, presence: true, numericality: true
  validates :max_nb_of_guests, presence: true, numericality: true

  geocoded_by :city
  after_validation :geocode, if: :city_changed?
end
