class Item < ApplicationRecord
  has_many :order_rows
  has_many :orders, through: :order_rows
  validates :title, :description, :price, :image_url, presence: true
end
