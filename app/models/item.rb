class Item < ApplicationRecord
  belongs_to :restaurant
  belongs_to :dish

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :callories, presence: true

end
