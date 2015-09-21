class Track
  def self.track_shipment(id)
    url = YAML.load(File.read('../config.yml'))["base_url"] + "v1/orders/" + id + "/track"
    headers = CreateHeaders.build
    HTTParty.get(url, :headers => headers)
  end
end
