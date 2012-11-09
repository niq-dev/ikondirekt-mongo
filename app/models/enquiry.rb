class Enquiry < Messaging
  #callback
  after_create :dispatch

  #custom validate
  validates_presence_of :amount
  validate :dynamic_field_validation

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

  #accepts_nested_attributes_for :income_info


  validates :amount, presence: true, numericality: {only_integer: true}


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

  #method definition
  def dynamic_field_validation
    if product.nil?
      puts product.name
      product.enquiry_fields.each do |i|
        field_value = self[i.name]
        case i.type
          when :input
          when :select
          when :checkbox
          when :radiobox
        end
        i.validation.each do |v|
          case v
            when "required"
              errors[i.name.to_sym] << i.title + " cannot be blank" if field_value.nil?
            when :float
              errors[i.name.to_sym] << i.title + " should be a float" if field_value.float?
            when :integer
              errors[i.name.to_sym] << i.title + " should be a integer" if field_value.integer?
          end
        end
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

  def method_missing(name, *args)
    fields_list = product.enquiry_fields.map { |w| w.machine_name }
    if fields_list.include? (name)
      self[name] = arg[0]
    else
      #super
    end
  end

  def state
    customer.state
  end

  def region
    customer.region
  end

  def place
    customer.place
  end

  delegate :address,
           :coordinates,
           :longitude,
           :latitude,
           :to => :customer

end