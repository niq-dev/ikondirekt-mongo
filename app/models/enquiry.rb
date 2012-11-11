class Enquiry < Messaging
  #callback
  after_initialize :initialize_dynamic_attributes
  before_validation :set_dynamic_validation
  after_create :dispatch

  #field definition
  field :amount, type: Integer
  field :comment, type: String
  has_and_belongs_to_many :chosen_partners, class_name: "Company"

  #relationship
  belongs_to :customer
  belongs_to :product, :autosave => true
  embeds_one :income_info
  has_many :replies, autosave: true
  belongs_to :places, class_name: "Location::Place"

  delegate :address,
           :coordinates,
           :longitude,
           :latitude,
           :state,
           :region,
           :place,
           :to => :customer

  accepts_nested_attributes_for :income_info

  #set validation for default field
  validates :amount, presence: true, numericality: {only_integer: true}
  validates :product, presence: true
  validates :customer, presence: true

  #state machine
  state_machine :status, :initial => :created do
    before_transition :created => :open, :do => :dispatch_replies
    event :dispatch do
      transition :created => :open
    end

    event :all_answered do
      transition :open => :closed
    end
  end

  private

  #set validation for dynamic field
  def set_dynamic_validation
    unless product.nil?
      product.enquiry_fields.each do |field|
        validates_presence_of field.machine_name.to_sym if field.validation.include? "required"
      end
    end
  end

  #initialize dynamic field
  def initialize_dynamic_attributes
    unless product.nil?
      product.enquiry_fields.each do |field|
        self[field.machine_name.to_sym] ||= nil
      end
    end
  end

  def valid_partners
    customer.within_partners
  end

  def dispatch_replies
    self.chosen_partners.each do |partner|
      self.replies.create(:company => partner)
    end
  end
end