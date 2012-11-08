class Company
  include Mongoid::Document

  mount_uploader :logo, LogoUploader

  field :name, type: String
  field :logo, type: String

  has_many :branches
  has_many :replies
  has_many :staffs
  has_and_belongs_to_many :products, :autosave => true
  has_and_belongs_to_many :enquiries, :inverse_of => :chosen_partners
  has_and_belongs_to_many :states, :class_name => "Location::State"

end