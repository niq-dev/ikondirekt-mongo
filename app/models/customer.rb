class Customer < User
  include Location::Component::Address
  include Geocoder::Model::Mongoid
  include Gmaps4rails::ActsAsGmappable

  after_validation :geocode

  field :title, :type => String
  field :birthday, :type => Date
  field :mobile, :type => String
  field :contacting, :type => String
  field :coordinates, :type => Array

  has_many :enquiries

  acts_as_gmappable :position => :coordinates,  :process_geocoding => false

  geocoded_by :full_address

  accepts_nested_attributes_for :address

  delegate :street,
           :state, :state_code,
           :region, :region_code,
           :place, :place_code,
           :to => :address

  def within_partners
    #location_state.partners   if  self.location_state
    Company.all
  end

  def clone_profile
    cp = CustomerProfile.new(birthday: birthday.to_s, contacting: contacting, first_name: first_name, gentler: gentler, last_name: last_name, mobile: mobile, title: title, email: email)
    #cp.address = self.address
    #cp
  end

  def longitude
    coordinates[0]
  end

  def latitude
    coordinates[1]
  end

end
