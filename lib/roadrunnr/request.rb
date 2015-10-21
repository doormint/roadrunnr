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
      HTTParty.post(x, :body => order_object.save.to_json, :headers => {'Content-Type' => 'application/json', "Authorization" => "Token #{self.access_token}"})
    end

    protected

    class << self
      attr_accessor :client_id, :client_secret, :timeout, :access_token, :url
    end
  end
end