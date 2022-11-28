class Item < ApplicationRecord
  has_many :carts
  validates :title, :description, :price, :image_url, presence: true
end