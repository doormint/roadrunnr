module Roadrunnr
  class Request
    attr_accessor :client_id, :client_secret, :timeout, :access_token, :url

    DEFAULT_TIMEOUT = 30

    def initialize(client_id: nil, client_secret: nil, timeout: nil, access_token: nil, url: nil)
      @client_id = client_id || self.class.client_id
      @client_secret = client_secret || self.class.client_secret
      @timeout = timeout || self.class.timeout || DEFAULT_TIMEOUT
      @access_token = access_token || self.class.access_token
      @url = url || self.class.url
    end

    def create_order(order_object)
      HTTParty.post(url + "v1/orders", :body => order_object.save.to_json, :headers => {'Content-Type' => 'application/json', "Authorization" => "Token #{self.access_token}"})
    end

    def ship_order(order_id)
      HTTParty.post(url + "v1/orders/ship", :order_id => order_id, :headers => {'Content-Type' => 'application/json', "Authorization" => "Token #{self.access_token}"})
    end

    def cancel_order(order_id)
      HTTParty.get(url + "v1/orders/#{order_id}/cancel", :headers => {'Content-Type' => 'application/json', "Authorization" => "Token #{self.access_token}"})
    end

    def track_order(order_id)
      HTTParty.get(url + "v1/orders/#{order_id}/track", :headers => {'Content-Type' => 'application/json', "Authorization" => "Token #{self.access_token}"})
    end 

    def serviceability(order_object)
      HTTParty.post(url + 'v1/orders/serviceability', body: order_object.save.to_json, :headers => {'Content-Type' => 'application/json', "Authorization" => "Token #{self.access_token}"})
    end

    def valid_checksum?(options = {})
      checksum = options[:checksum]
      order_id = options[:order_id]
      checksum == Digest::MD5.hexdigest(order_id + self.access_token)
    end

    protected

    class << self
      attr_accessor :client_id, :client_secret, :timeout, :access_token, :url
    end
  end
end