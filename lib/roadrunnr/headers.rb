class CreateHeaders
  def self.build
    @config = YAML.load(File.read('config.yml'))
    new @config
    generate_token
    get_headers
  end

  def self.generate_token
    url = @config["base_url"] + "oauth/token?grant_type=client_credentials&clie\
nt_id=" + @config["client_id"] + "&client_secret=" + @config["client_secret"]
    HTTParty.get(url)["access_token"]
  end

  def self.get_headers
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => 'Token ' + self.generate_token
    }
    @config["headers"] = headers
    File.open('../config.yml', 'w') { |f| f.write @config.to_yaml }
    headers
  end

  def initialize config
    @config = config
  end
end
