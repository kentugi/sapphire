class Boat < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:boat_type]

  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  BOAT_IMAGES = ["https://asset.kompas.com/crops/CTKI1PcncTVjcGjPhhN8IfVxIOo=/0x0:1000x667/750x500/data/photo/2020/08/30/5f4b713cd3a45.jpg"]
  BOAT_TYPES = ["catamaran", "yacht", "boatel"]
  BOAT_DESCRIPTIONS = [
    "Samata offers guests plenty of opportunities for outdoor living with three sun-dappled wooden decks including a dive deck, the main deck with an al fresco dining area for leisurely lunches and meals under the stars, and an upper deck with sun loungers and side tables for soaking up the sun and sea gazing.",
    "Haruku was designed in Australia as a rugged long-range craft that could carry 20 passengers to remote locations in excellent safety and great comfort. At the location she becomes the 'mother ship' from which to explore exotic destinations on both land and sea. Haruku is fitted with modern clean lines.",
    "Raja Laut was designed using traditional boat building techniques, and this nod to the past can be seen in the strong ironwood hull and two-masted gaff-rigged design. Step onboard and you are greeted with an expansive teak deck sporting loungers.",
    "The CATAMARAN Hybrid is the latest project designed by the interior designer of the group, it was specially built to offer 2-6 night private cruises and to accommodate up to 4 passengers in its large living space of 53 square meters.",
  ]
  LOCATIONS = ["Benoa/Denpasar", "Port Padangbai", "Gilimanuk"]
  PRICES = ["2000000", "3000000", "4000000"]
  # has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :boat_type, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
