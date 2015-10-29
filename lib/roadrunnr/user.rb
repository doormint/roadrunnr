module Roadrunnr
  class User
    attr_accessor :name, :phone_no, :type, :external_id, :email, :full_address

    def initialize
      @full_address = FullAddress.new
    end


    def add_user_details(options = {})
      @name = options[:name]
      @phone_no = options[:phone_no]
      @email = options[:email]
      @type = options[:type]
      @external_id = options[:external_id]
    end

    def add_user_full_address(options = {})
      address = options[:address]
      locality = options[:locality]
      sub_locality = options[:sub_locality]
      city = options[:city]
      lat = options[:lat]
      lng = options[:lng]
      @full_address.add_full_address(:address => address, :locality => locality, :sub_locality => sub_locality, :city => city, :lat => lat, :lng => lng)
    end

    def valid?
      name.present? && phone_no.present? && type.present? && external_id.present? && email.present? && full_address.valid?
    end

    def save
      {
        'name'=> @name,
        'phone_no'=> @phone_no,
        'type'=> @type,
        'external_id'=> @external_id,
        'email' => @email,
        'full_address'=> @full_address.save
      }
    end
  end

end
