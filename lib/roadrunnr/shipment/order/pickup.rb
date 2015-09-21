class Pickup
  attr_accessor :user

  def initialize
    @user = create_user
  end

  def create_user
    User.new
  end

  def add_user_details(name, phone_no, email, type, external_id)
    @user.add_user_details(name, phone_no, email, type, external_id)
  end

  def add_user_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
    @user.add_user_full_address(address, locality_name, sub_locality_name, city_name, geo_latitude, geo_longitude)
  end

  def save
    { 'user'=> @user.save }
  end
end
