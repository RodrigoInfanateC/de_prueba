class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items
  has_many :items, through: :order_items

  def add_item(item)
    items << item
    update_total_amount
  end
  
  def update_total_amount
    self.total_amount = items.sum(:price)
    save
  end
end
