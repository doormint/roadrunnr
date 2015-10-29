require 'spec_helper'

describe Roadrunnr::Order do

  let!(:request) { Roadrunnr::Request.new(:client_id => '123', :client_secret => 'secret', :timeout => 60, :access_token => 'token', url: 'http://128.199.241.199/') }


  it 'should create order object' do
    order = Roadrunnr::Order.new(:callback_url => 'http://google.com')
    expect(order.callback_url).to eq('http://google.com')
    order.add_pickup_details(:name => "Samsung store", :phone_no => "08056190907", :email => "samsung@gmail.com", :type => "merchant", :external_id => "BLR-NAT-123")
    expect(order.pickup.valid?).to be(false)
    order.add_pickup_full_address(:address => "Shop no 51, 5th block", :locality => "Koramangala", :sub_locality => "5th block", 
                                  :city => "Bangalore", :lat => "12.935322", :lng => "77.618754")
    expect(order.pickup.valid?).to be(true)
    expect(order.drop.valid?).to be(false)
    order.add_drop_details(:name => "Samsung store", :phone_no => "08056190907", :email => "samsung@gmail.com", :type => "merchant", :external_id => "BLR-NAT-123")
    expect(order.drop.valid?).to be(false)
    order.add_drop_full_address(:address => "Shop no 51, 5th block", :locality => "Koramangala", :sub_locality => "5th block", 
                                :city => "Bangalore", :lat => "12.935322", :lng => "77.618754")
    expect(order.drop.valid?).to be(true)
    order.add_order_details(:order_id => "last2091020", :order_value => "255.0", :amount_to_be_collected => "234.45", :order_type => "Cash On Delivery")
    expect(order.order_details.valid?).to eq(true)
    expect(order.valid?).to eq(true)
    expect(request).to respond_to(:create_order).with(1).argument
    expect(request).to respond_to(:cancel_order).with(1).argument
    expect(request).to respond_to(:track_order).with(1).argument
    expect(request).to respond_to(:serviceability).with(1).argument
    order_id = '1234'
    expect(request.valid_checksum?(:checksum => '3741049b355fa6e15ac753e9e952afea', :order_id => order_id)).to eq(true)
  end

end
