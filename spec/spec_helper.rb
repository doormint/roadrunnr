$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'roadrunnr'
require "pry"

def create_order
  order = Roadrunnr::Order.new
  order.add_pickup_details(:name => "Samsung store", :phone_no => "08056190907", :email => "samsung@gmail.com", :type => "merchant", :external_id => "BLR-NAT-123")
  order.add_pickup_full_address(:address => "Shop no 51, 5th block", :locality => "Koramangala", :sub_locality => "5th block", 
                                :city => "Bangalore", :lat => "12.935322", :lng => "77.618754")

  order.add_drop_details(:name => "Joe", :phone_no => "1234567890", :email => "joe@gmail.com", :type => "customer", :external_id => "BLR-NAT-123")
  order.add_drop_full_address(:address => "apartments, 6th block", :locality => "Koramangala", :sub_locality => "5th block", 
                              :city => "Bangalore", :lat => "12.943822", :lng => "77.628754")
  order.add_order_details(:order_id => "last2091020", :order_value => "255.0", :amount_to_be_collected => "234.45", 
                          :order_type => "Cash On Delivery", :expected_delivery_time => '2015-10-30 19:01:47 +0530')
  order.add_order_item(:quantity => 1, :price => 120, :item_name => "Samsung screen Guard")
  order.add_order_item(:quantity => 1, :price => 535, :item_name=> "Samsung charger")

  order.add_created_at("2015-05-05 01:50")
  order.add_callback_url("callback/url")
  order
end
