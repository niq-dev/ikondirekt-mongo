class CustomerProfile
  include Mongoid::Document

  field :first_name, :type => String
  field :last_name, :type => String
  field :gentler, :type => String

  field :title, :type => String

  field :birthday, :type => String
  field :mobile, :type => String
  field :contacting, :type => String

  embeds_one :address, class_name: "Location::Address"
  embedded_in :reply
  accepts_nested_attributes_for :address
end