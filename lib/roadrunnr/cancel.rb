class Cancel
  def self.cancel_shipment(id)
    url = YAML.load(File.read('../config.yml'))["base_url"] + "v1/orders/" + id + "/cancel"
    headers = CreateHeaders.build
    HTTParty.get(url, :headers => headers)
  end
end
