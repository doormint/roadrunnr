module Roadrunnr

  class OrderItem
    attr_accessor :quantity, :price, :item

    def initialize(options = {})
      @quantity = options[:quantity]
      @price = options[:price]
      item_name = options[:item_name]
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

end
