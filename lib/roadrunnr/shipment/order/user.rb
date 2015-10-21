class User
  attr_accessor :name, :phone_no, :type, :external_id, :email, :full_address

  def initialize
    @full_address = create_full_address
  end

  def create_full_address
    FullAddress.new
  end

  def add_user_details(name, phone_no, email, type, external_id)
    @name = name
    @phone_no = phone_no
    @email = email
    @type = type
    @external_id = external_id
  end

  def add_user_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    @full_address.add_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
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
