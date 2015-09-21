class Shipment
  def self.build order
    build_headers
    new order, @headers
  end

  def self.build_headers
    @headers = CreateHeaders.build
  end

  def initialize order, headers
    @order = order
    @headers = headers
  end

  def create_shipment
    url = YAML.load(File.read('config.yml'))["base_url"] + "v1/orders/ship"
    HTTParty.post(url, :body => @order.save.to_json, :headers => @headers)
  end

  def track_shipment
    id = JSON.parse(self.create_shipment.body)["order_id"]
    Track.track_shipment(id)
  end

  def serviceability
    Serviceability.get_serviceability(@order)
  end

  def cancel_shipment
    id = JSON.parse(self.create_shipment.body)["order_id"]
    Cancel.cancel_shipment(id)
  end
end
