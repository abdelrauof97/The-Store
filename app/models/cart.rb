class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    all_price = 0
    self.line_items.each { |line_item|
      all_price += line_item.item.price * line_item.quantity
    }
    all_price
  end

  def add_item(item_id)
    if line_item = self.line_items.find { |line_item| line_item.item_id == item_id }
      line_item.quantity += 1
      line_item
    else
      line_item = LineItem.new(item_id: item_id, cart_id: self.id, quantity: 1)
    end
  end

  def checkout
    self.status = "submitted"
    self.line_items.each do |line_item|
      line_item.item.inventory = line_item.item.inventory.to_i - line_item.quantity.to_i
      line_item.item.save
    end
  end

end
