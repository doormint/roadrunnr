module Roadrunnr
  class OrderDetails
    attr_accessor :order_id, :order_value, :amount_to_be_collected, :order_type, :order_items, :expected_delivery_time, :expected_pickup_time

    def initialize
      @order_type = OrderType.new
      @order_items = []
    end

    def add_order(options = {})
      @order_id = options[:order_id]
      @order_value = options[:order_value]
      @expected_delivery_time = options[:expected_delivery_time]
      @expected_pickup_time = options[:expected_pickup_time]
      @amount_to_be_collected = options[:amount_to_be_collected]

      @order_type.name = options[:order_type]
    end

    def add_order_item(quantity, price, item_name)

      @order_items << OrderItem.new(:quantity => quantity, :price => price, :item_name => item_name).save
    end

    def valid?
      order_id.present? && order_value.present? && amount_to_be_collected.present? && order_type.valid?
    end

    def save
      {
        'order_id'=> @order_id,
        'order_value'=> @order_value,
        'expected_delivery_time' => @expected_delivery_time,
        'expected_pickup_time' => @expected_pickup_time,
        'amount_to_be_collected'=> @amount_to_be_collected,
        'order_type'=> @order_type.save,
        'order_items'=> @order_items
      }
    end
  end

  class OrderType
    attr_accessor :name

    def valid?
      name.present?
    end

    def save
      return { 'name'=> @name }
    end
  end
  
end
