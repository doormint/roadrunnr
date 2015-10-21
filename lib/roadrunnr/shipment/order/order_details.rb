class OrderDetails
  attr_accessor :order_id, :order_value, :amount_to_be_collected, :order_type, :order_items

  def initialize
    @order_type = create_order_type
    @order_items = []
  end

  def create_order_type
    OrderType.new
  end

  def add_order(order_id, order_value, amount_to_be_collected, order_type_name)
    @order_id = order_id
    @order_value = order_value
    @amount_to_be_collected = amount_to_be_collected
    @order_type.name = order_type_name
  end

  def add_order_item(quantity, price, item_name)
    @order_items << OrderItem.new(quantity, price, item_name).save
  end

  def valid?
    order_id.present? && order_value.present? && amount_to_be_collected.present? && order_type.valid?
  end

  def save
      {
        'order_id'=> @order_id,
        'order_value'=> @order_value,
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
