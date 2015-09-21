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
  **Set client_id and client_secret in config.yml**

  **Create an order**

    order = Order.build
    order.add_pickup_details(name, phone_no, email, type, external_id)
    order.add_pickup_full_address("address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude")

    order.add_drop_details(name, phone_no, email, type, external_id)
    order.add_drop_full_address("address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude")

    order.add_order_details(order_id, order_value, amount_to_be_collected, order_type_name)
    order.add_order_item(quantity, price, item_name)

    order.add_created_at(created_at)
    order.add_callback_url(callback_url)

  **Make shipment**

    shipment = Shipment.build order
    shipment.create_shipment

  **Track shipment**

  shipment.create_shipment

  **Cancel shipment**

  shipment.cancel_shipment

  **Get serviceability before creating shipment**

  shipment.serviceability

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/doormint/roadrunnr.
