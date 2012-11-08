class Staff < User

  include Mongoid::DataTable

  rolify
  paginates_per 50

  mount_uploader :avatar, AvatarUploader

  before_create :add_role_advisor

  #field definition
  field :title, :type => String
  field :phone, :type => String
  field :fax, :type => String
  field :position, :type => String
  field :office_hours, :type => String

  #relationship
  belongs_to :company
  belongs_to :branch
  has_many :replies, :inverse_of => :manager
  has_many :replies, :inverse_of => :staff

  def add_role_advisor
    self.add_role :advisor
  end

end
