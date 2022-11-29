class Order < ApplicationRecord
  belongs_to :user
  has_one :cart
end
