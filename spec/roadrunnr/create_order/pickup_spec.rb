require_relative '../../spec_helper'

describe Pickup do
  before do
    @order =  CreateOrder.create
  end

  it "pickup has name" do
    expect(@order.pickup.user.name).to eq("Samsung store")
  end

  it "pickup has phone_no" do
    expect(@order.pickup.user.phone_no).to eq("08056190907")
  end

  it "pickup has email" do
    expect(@order.pickup.user.email).to eq("samsung@gmail.com")
  end

  it "pickup has type" do
    expect(@order.pickup.user.type).to eq("merchant")
  end

  it "pickup has external_id" do
    expect(@order.pickup.user.external_id).to eq("BLR-NAT-123")
  end

  it "pickup has full_address address" do
    expect(@order.pickup.user.full_address.address).to eq("Shop no 51, 5th block")
  end

  it "pickup has full_address locality name" do
    expect(@order.pickup.user.full_address.locality.name).to eq("Koramangala")
  end

  it "pickup has full_address sub_locality name" do
    expect(@order.pickup.user.full_address.sub_locality.name).to eq("5th block")
  end

  it "pickup has full_address city name" do
    expect(@order.pickup.user.full_address.city.name).to eq("Bangalore")
  end

  it "pickup has full_address geo latitude" do
    expect(@order.pickup.user.full_address.geo.latitude).to eq("12.935322")
  end

  it "pickup has full_address geo longitude" do
    expect(@order.pickup.user.full_address.geo.longitude).to eq("77.618754")
  end
end
