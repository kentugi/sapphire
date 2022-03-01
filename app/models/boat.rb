class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  # has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :boat_type, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :phone, presence: true
end
