module Roadrunnr
  class Pickup
    attr_accessor :user

    def initialize
      @user = User.new
    end

    def add_user_details(options = {})
      name = options[:name]
      phone_no = options[:phone_no]
      email = options[:email]
      type = options[:type]
      external_id = options[:external_id]
      @user.add_user_details(:name => name, :phone_no => phone_no, :email => email, :type => type, :external_id => external_id)
    end

    def add_user_full_address(options = {})
      address = options[:address]
      locality = options[:locality]
      sub_locality = options[:sub_locality]
      city = options[:city]
      lat = options[:lat]
      lng = options[:lng]
      @user.add_user_full_address(:address => address, :locality => locality, :sub_locality => sub_locality, :city => city, :lat => lat, :lng => lng)
    end

    def valid?
      user.valid?
    end

    def save
      { 'user'=> @user.save }
    end
  end
  
end
