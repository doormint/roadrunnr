# Roadrunnr

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roadrunnr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roadrunnr

## Usage
Obtain  access_toek from http://128.199.241.199/oauth/token?grant_type=client_credentials&client_id=123&client_secret=secret for staging/testing environment and change host to http://roadrunnr.in/ for production ENV

**Creating roadrunnr request object**

   

    request = Roadrunnr::Request.new(:client_id => '123', 
                    :client_secret => 'secret', 
                    :timeout => 60, 
                    :access_token => 'token', 
                    :url => 'http://128.199.241.199/')

Set the values according to ENV



  **Build an order**

    order = Roadrunnr::Order.new
    order.add_pickup_details(name, phone_no, email, type, external_id)
    order.add_pickup_full_address("address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude")

    order.add_drop_details(name, phone_no, email, type, external_id)
    order.add_drop_full_address("address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude")

    order.add_order_details(order_id, order_value, amount_to_be_collected, order_type_name)
    order.add_order_item(quantity, price, item_name)

    order.add_created_at(created_at)
    order.add_callback_url(callback_url)

  **Get serviceability before creating order**
  
    request.serviceability(order)


  **Create an order**
  
    request.create_order(order)


  **Track order**

    request.track_order(order_id)

  **Cancel order**   

  request.cancel_order(order_id)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/doormint/roadrunnr.
