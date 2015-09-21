class Serviceability
  def self.get_serviceability(order)
    headers = CreateHeaders.build
    url = YAML.load(File.read('config.yml'))["base_url"] + "v1/orders/serviceability"
    HTTParty.post(url, :body => order.save.to_json, :headers => headers)
  end
end
