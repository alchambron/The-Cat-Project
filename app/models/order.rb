class Order < ApplicationRecord
  belongs_to :user
  has_many :order_rows
  has_many :items, through: :order_rows
end
