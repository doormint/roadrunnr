require 'spec_helper'

describe Roadrunnr do
  it 'has a version number' do
    expect(Roadrunnr::VERSION).not_to be nil
  end
end

describe Shipment do
  before do
    @order = CreateOrder.create
    @shipment = Shipment.build @order
  end

  it 'create shipment' do
    expect(@shipment.create_shipment.code).to eq(200)
  end

  it 'track shipment' do
    expect(@shipment.track_shipment["status"]["code"]).to eq(200)
  end

  it 'get serviceability' do
    expect(@shipment.serviceability["serviceable"]).to eq(true)
  end

  it 'cancel shipment' do
    expect(@shipment.cancel_shipment["status"]["code"]).to eq(200)
  end
end
