class Order
  attr_accessor :pickup, :drop, :order_details, :created_at, :callback_url

  def self.build
    build_pickup
    build_drop
    build_order_details
    new @pickup, @drop, @order_details
  end

  def self.build_pickup
    @pickup = Pickup.new
  end

  def self.build_drop
    @drop = Drop.new
  end

  def self.build_order_details
    @order_details = OrderDetails.new
  end

  def initialize pickup, drop, order_details
    @pickup = pickup
    @drop = drop
    @order_details = order_details
  end

  def add_details(obj, name, phone_no, email, type, external_id)
    obj.add_user_details(name, phone_no, email, type, external_id)
  end

  def add_full_address(obj, address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    obj.add_user_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
  end

  def add_pickup_details(name, phone_no, email, type, external_id)
    add_details(@pickup, name, phone_no, email, type, external_id)
  end

  def add_pickup_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    add_full_address(@pickup, address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
  end

  def add_drop_details(name, phone_no, email, type, external_id)
    add_details(@drop, name, phone_no, email, type, external_id)
  end

  def add_drop_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    add_full_address(@drop, address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
  end

  def add_order_details(order_id, order_value, amount_to_be_collected, order_type_name)
    @order_details.add_order(order_id, order_value, amount_to_be_collected, order_type_name)
  end

  def add_order_item(quantity, price, item_name)
    @order_details.add_order_item(quantity, price, item_name)
  end

  def add_created_at(created_at)
    @created_at = created_at
  end

  def add_callback_url(callback_url)
    @callback_url = callback_url
  end

  def save
    {
      'pickup'=> @pickup.save,
      'drop'=> @drop.save,
      'order_details'=> @order_details.save,
      'created_at' => @created_at,
      'callback_url' => @callback_url
    }
  end
end
