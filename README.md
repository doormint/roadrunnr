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
    order.add_pickup_details(:name => "Samsung store", :phone_no => "1234567890", :email => "samsung@gmail.com", :type => "merchant", :external_id => "BLR-NAT-123")
    
    order.add_pickup_full_address(:address => "Shop no 51, 5th block", :locality => "Koramangala", :sub_locality => "5th :city => "Bangalore", :lat => "12.935322", :lng => "77.618754")

    order.add_drop_details(:name => "Samsung store", :phone_no => "08056190907", :email => "samsung@gmail.com", :type => "merchant", :external_id => "BLR-NAT-123")

    order.add_drop_full_address(:address => "Shop no 51, 5th block", :locality => "Koramangala", :sub_locality => "5th block", :city => "Bangalore", :lat => "12.935322", :lng => "77.618754")

    order.add_order_details(:order_id => "last2091020", :order_value => "255.0", :amount_to_be_collected => "234.45", :order_type => "Cash On Delivery", :expected_delivery_time => Time.now)
                                  

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
