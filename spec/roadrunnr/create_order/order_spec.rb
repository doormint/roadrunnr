require_relative '../../spec_helper'

describe Roadrunnr::Order do

  let!(:request) { Roadrunnr::Request.new(:client_id => '123', :client_secret => 'secret', :timeout => 60, :access_token => 'token', url: 'http://128.199.241.199/') }


  it 'should create order object' do
    order = Roadrunnr::Order.new(:callback_url => 'http://google.com')
    expect(order.callback_url).to eq('http://google.com')
    order.add_pickup_details("Samsung store", "08056190907", "samsung@gmail.com", "merchant", "BLR-NAT-123")
    expect(order.pickup.valid?).to be(false)
    order.add_pickup_full_address("Shop no 51, 5th block", "Koramangala", "5th block", "Bangalore", "12.935322", "77.618754")
    expect(order.pickup.valid?).to be(true)
    expect(order.drop.valid?).to be(false)
    order.add_drop_details("Samsung store", "08056190907", "samsung@gmail.com", "merchant", "BLR-NAT-123")
    expect(order.drop.valid?).to be(false)
    order.add_drop_full_address("Shop no 51, 5th block", "Koramangala", "5th block", "Bangalore", "12.935322", "77.618754")
    expect(order.drop.valid?).to be(true)
    order.add_order_details("last2091020", "255.0", "234.45", "Cash On Delivery")
    expect(order.order_details.valid?).to eq(true)
    expect(order.valid?).to eq(true)
    expect(request).to respond_to(:create_order).with(1).argument
    request.create_order(order)

    binding.pry
  end

end
