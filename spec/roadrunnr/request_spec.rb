require "spec_helper"

describe Roadrunnr::Request do

  it "have no API by default" do
    roadrunnr = Roadrunnr::Request.new
    expect(roadrunnr.client_secret).to be_nil
    expect(roadrunnr.client_id).to be_nil
    expect(roadrunnr.timeout).to eq(30)
    expect(roadrunnr.access_token).to be_nil
    expect(roadrunnr.url).to be_nil
  end

  it "set an API key in constructor" do
    roadrunnr = Roadrunnr::Request.new(:client_id => '123', :client_secret => 'secret', :timeout => 60, :access_token => 'token', url: 'http://128.199.241.199/')
    expect(roadrunnr.client_id).to eq('123')
    expect(roadrunnr.client_secret).to eq('secret')
    expect(roadrunnr.access_token).to eq('token')
    expect(roadrunnr.timeout).to eq(60)
    expect(roadrunnr.url).to eq("http://128.199.241.199/")
  end

  it "set an API key via setter" do
    roadrunnr = Roadrunnr::Request.new
    roadrunnr.client_id = "123"
    roadrunnr.client_secret = "secret"
    roadrunnr.access_token = 'token'
    roadrunnr.url = "http://128.199.241.199/"
    expect(roadrunnr.client_id).to eq('123')
    expect(roadrunnr.client_secret).to eq('secret')
    expect(roadrunnr.access_token).to eq('token')
    expect(roadrunnr.url).to eq("http://128.199.241.199/")
  end

end