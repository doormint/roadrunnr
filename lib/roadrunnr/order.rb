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

    def add_details(obj, name, phone_no, email, type, external_id)
      obj.add_user_details(name, phone_no, email, type, external_id)
    end

    def add_full_address(obj, address, locality_name, sub_locality_name, city_name, geo_latitude=nil, geo_longitude=nil)
      obj.add_user_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    end

    def add_pickup_details(name, phone_no, email, type, external_id)
      add_details(@pickup, name, phone_no, email, type, external_id)
    end

    def add_pickup_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude=nil, geo_longitude=nil)
      add_full_address(@pickup, address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    end

    def add_drop_details(name, phone_no, email, type, external_id)
      add_details(@drop, name, phone_no, email, type, external_id)
    end

    def add_drop_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude=nil, geo_longitude=nil)
      add_full_address(@drop, address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    end

    def add_order_details(order_id, order_value, amount_to_be_collected, order_type_name)
      @order_details.add_order(order_id, order_value, amount_to_be_collected, order_type_name)
    end

    def add_order_item(quantity, price, item_name)
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
  end

end
