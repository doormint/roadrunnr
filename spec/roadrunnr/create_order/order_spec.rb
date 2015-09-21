require_relative '../../spec_helper'

describe Order do
  before do
    @order =  CreateOrder.create
  end

  it "order has created_at" do
    expect(@order.created_at).to eq("2015-05-05 01:50")
  end

  it "order has callback_url" do
    expect(@order.callback_url).to eq("callback/url")
  end
end
