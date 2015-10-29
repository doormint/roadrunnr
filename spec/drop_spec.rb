require "spec_helper"

describe Roadrunnr::Drop do
  before do
    @order =  create_order
  end

  it "drop has name" do
    expect(@order.drop.user.name).to eq("Joe")
  end

  it "drop has phone_no" do
    expect(@order.drop.user.phone_no).to eq("1234567890")
  end

  it "drop has email" do
    expect(@order.drop.user.email).to eq("joe@gmail.com")
  end

  it "drop has type" do
    expect(@order.drop.user.type).to eq("customer")
  end

  it "drop has external_id" do
    expect(@order.drop.user.external_id).to eq("BLR-NAT-123")
  end

  it "drop has full_address address" do
    expect(@order.drop.user.full_address.address).to eq("apartments, 6th block")
  end

  it "drop has full_address locality name" do
    expect(@order.drop.user.full_address.locality.name).to eq("Koramangala")
  end

  it "drop has full_address sub_locality name" do
    expect(@order.drop.user.full_address.sub_locality.name).to eq("5th block")
  end

  it "drop has full_address city name" do
    expect(@order.drop.user.full_address.city.name).to eq("Bangalore")
  end

  it "drop has full_address geo latitude" do
    expect(@order.drop.user.full_address.geo.latitude).to eq("12.943822")
  end

  it "drop has full_address geo longitude" do
    expect(@order.drop.user.full_address.geo.longitude).to eq("77.628754")
  end
end
