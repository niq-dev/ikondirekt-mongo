class Branch
  include Mongoid::Document
  include Location::Component::Address
  include Geocoder::Model::Mongoid
  include Mongoid::DataTable

  geocoded_by :full_address
  after_validation :geocode
  #acts_as_gmappable :position => :coordinates

  field :name, type: String
  field :email, type: String
  field :office_hours, type: String
  field :coordinates, type: Array

  belongs_to :company
  has_many :staffs

  accepts_nested_attributes_for :address

  delegate :street,
           :phone,
           :fax,
           :to => :address

  #validates_presence_of :name, :email, :address
  validates :email, :presence => true, :uniqueness => true

end
