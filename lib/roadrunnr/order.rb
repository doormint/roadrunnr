module Roadrunnr

  class Order
    attr_accessor :pickup, :drop, :order_details, :created_at, :callback_url

    def initialize(options = {})
      @pickup = options[:pickup] || Pickup.new
      @drop = options[:drop] || Drop.new
      @order_details = options[:order_details] ||  OrderDetails.new
      @created_at = options[:created_at] || Time.now
      @callback_url = options[:callback_url]
    end

    def valid?
      pickup.valid? && drop.valid? && order_details.valid?
    end

    def add_pickup_details(options = {})
      name = options[:name]
      phone_no = options[:phone_no]
      email = options[:email]
      type = options[:type]
      external_id = options[:external_id]
      add_details(@pickup, name, phone_no, email, type, external_id)
    end

    def add_pickup_full_address(options = {})
      address = options[:address]
      locality = options[:locality]
      sub_locality = options[:sub_locality]
      city = options[:city]
      lat = options[:lat]
      lng = options[:lng]
      add_full_address(@pickup, address, locality, sub_locality, city, lat, lng)
    end

    def add_drop_details(options = {})
      name = options[:name]
      phone_no = options[:phone_no]
      email = options[:email]
      type = options[:type]
      external_id = options[:external_id]
      add_details(@drop, name, phone_no, email, type, external_id)
    end

    def add_drop_full_address(options = {})
      address = options[:address]
      locality = options[:locality]
      sub_locality = options[:sub_locality]
      city = options[:city]
      lat = options[:lat]
      lng = options[:lng]
      add_full_address(@drop, address, locality, sub_locality, city, lat, lng)
    end

    def add_order_details(options = {})
      order_id = options[:order_id]
      order_value = options[:order_value]
      amount_to_be_collected = options[:amount_to_be_collected]
      order_type = options[:order_type]
      @order_details.add_order(:order_id => order_id, :order_value => order_value, :amount_to_be_collected => amount_to_be_collected, :order_type => order_type)
    end

    def add_order_item(options = {})
      quantity = options[:quantity]
      price = options[:price]
      item_name = options[:item_name]
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

    private

    def add_details(obj, name, phone_no, email, type, external_id)
      obj.add_user_details(:name => name, :phone_no => phone_no, :email => email, :type => type, :external_id => external_id)
    end

    def add_full_address(obj, address, locality_name, sub_locality_name, city_name, geo_latitude=nil, geo_longitude=nil)
      obj.add_user_full_address(:address => address, :locality => locality_name, :sub_locality => sub_locality_name, :city => city_name, :lat => geo_latitude, :lng => geo_longitude)
    end

  end

end
