require "spec_helper"

describe Roadrunnr::OrderDetails do
  before do
    @order =  create_order
  end

  it "order_details has order_id" do
    expect(@order.order_details.order_id).to eq("last2091020")
  end

  it "order_details has order_value" do
    expect(@order.order_details.order_value).to eq("255.0")
  end

  it "order_details has amount_to_be_collected" do
    expect(@order.order_details.amount_to_be_collected).to eq("234.45")
  end

  it "order_details has order_type_name" do
    expect(@order.order_details.order_type.name).to eq("Cash On Delivery")
  end

  context "order_details has order_items" do
    it "number of order items" do
      expect(@order.order_details.order_items.size).to eq(2)
    end

    it "order_item 0" do
      expect(@order.order_details.order_items[0]).to eq({"quantity"=>1, "price"=>120, "item"=>{"name"=>"Samsung screen Guard"}})
    end

    it "order_item 1" do
      expect(@order.order_details.order_items[1]).to eq({"quantity"=>1, "price"=>535, "item"=>{"name"=>"Samsung charger"}})
    end
  end
end
