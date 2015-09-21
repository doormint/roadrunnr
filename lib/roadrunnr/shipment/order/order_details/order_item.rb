class OrderItem
  attr_accessor :quantity, :price, :item

  def initialize(quantity, price, item_name)
    @quantity = quantity
    @price = price
    @item = create_item(item_name)
  end

  def create_item(item_name)
    Item.new(item_name)
  end

  def save
    {
      'quantity' => @quantity,
      'price' => @price,
      'item' => @item.save
    }
  end
end

class Item
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def save
    { 'name' => @name }
  end
end
