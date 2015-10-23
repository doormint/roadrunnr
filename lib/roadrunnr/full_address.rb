module Roadrunnr
  class FullAddress
    attr_accessor :address, :locality, :sub_locality, :city, :geo

    def initialize
      @locality = create_locality
      @sub_locality = create_sub_locality
      @city = create_city
      @geo = create_geo
    end

    def create_locality
      Locality.new
    end

    def create_sub_locality
      SubLocality.new
    end

    def create_city
      City.new
    end

    def create_geo
      Geo.new
    end

    def valid?
      address.present? && locality.valid? && sub_locality.valid? && city.valid? && geo.valid?
    end

    def add_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude=nil, geo_longitude=nil)
      @address = address
      @locality.add_name(locality_name)
      @sub_locality.add_name(sub_locality_name)
      @city.add_name(city_name)
      @geo.add_geo(geo_latitude, geo_longitude)
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
