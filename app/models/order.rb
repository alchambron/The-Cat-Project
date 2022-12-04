class Order < ApplicationRecord
  belongs_to :user
  has_many :order_rows
  has_many :items, through: :order_rows

  def total_price
    items.map { |i| i.price }
         .reduce(:+)
  end

  def items_count
    return items.length
  end
end
