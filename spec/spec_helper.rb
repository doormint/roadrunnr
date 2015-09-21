$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'roadrunnr'

class CreateOrder
  def self.create
    order = Order.build
    order.add_pickup_details("Samsung store", "08056190907", "samsung@gmail.com", "merchant", "BLR-NAT-123")
    order.add_pickup_full_address("Shop no 51, 5th block", "Koramangala", "5th block", "Bangalore", "12.935322", "77.618754")

    order.add_drop_details("Joe", "9656190907", "joe@gmail.com", "customer", "MND-756")
    order.add_drop_full_address("apartments, 6th block", "Koramangala", "5th block", "Bangalore", "12.943822", "77.628754")

    order.add_order_details("last2091020", "255.0", "234.45", "Cash On Delivery")
    order.add_order_item(1, 120, "Samsung screen Guard")
    order.add_order_item(1, 535, "Samsung charger")

    order.add_created_at("2015-05-05 01:50")
    order.add_callback_url("callback/url")

    return order
  end
end
