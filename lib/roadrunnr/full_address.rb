module Roadrunnr
  class FullAddress
    attr_accessor :address, :locality, :sub_locality, :city, :geo

    def initialize
      @locality = Locality.new
      @sub_locality = SubLocality.new
      @city = City.new
      @geo = Geo.new
    end


    def valid?
      address.present? && locality.valid? && sub_locality.valid? && city.valid? && geo.valid?
    end

    def add_full_address(options = {})
      @address = options[:address]
      locality = options[:locality]
      sub_locality = options[:sub_locality]
      city = options[:city]
      lat = options[:lat]
      lng = options[:lng]
      @locality.add_name(locality)
      @sub_locality.add_name(sub_locality)
      @city.add_name(city)
      @geo.add_geo(lat, lng)
    end

    def save
      {
        'address'=> @address,
        'locality'=> @locality.save,
        'sub_locality'=> @sub_locality.save,
        'city'=> @city.save,
        'geo'=> @geo.save
      }
    end
  end

  class Name
    attr_accessor :name

    def add_name(name)
      @name = name
    end

    def valid?
      name.present?
    end

    def save
      { 'name'=> @name }
    end
  end

  class Locality < Name;end

  class SubLocality < Name;end

  class City < Name;end

  class Geo
    attr_accessor :latitude, :longitude

    def add_geo(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def valid?
      latitude.present? && longitude.present?
    end

    def save
      { 'latitude'=> @latitude, 'longitude'=> @longitude }
    end
  end

end
