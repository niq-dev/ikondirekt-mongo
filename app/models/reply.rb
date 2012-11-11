class Reply < Messaging
  #callback
  after_initialize :initialize_dynamic_attributes
  before_validation :set_dynamic_validation

  #field definition
  field :meeting, type: String

  #relationship
  belongs_to :enquiry
  belongs_to :company
  belongs_to :manager, class_name: "Staff"
  belongs_to :advisor, class_name: "Staff"
  embeds_one :customer_profile

  accepts_nested_attributes_for :customer_profile

  delegate :product,
           :address,
           :coordinates,
           :longitude,
           :latitude,
           :state,
           :region,
           :place,
           :to => :enquiry

  def assign_advisor(advisor)
    self.advisor = advisor
    self.save!
    assign
  end

  #state machine
  state_machine :status, :initial => :created do
    before_transition :choice => any - :choiced, :do => :copy_profile
    event :assign do
      transition :created => :assigned
    end

    event :answer do
      transition :assigned => :answered
    end

    event :choice do
      transition :answered => :choiced
    end

    event :reject do
      transition :answered => :rejected
    end

    state :answered, :choiced, :rejected do
      def replied?
        true
      end
    end

    state :created, :assigned do
      def replied?
        false
      end
    end
  end

  def state_name_for_customer
    if self.status == "created" or self.status == "assigned"
      "not answered"
    else
      self.status
    end
  end


  def method_missing(name, *args)
    fields_list = enquiry.product.reply_fields.map { |w| w.machine_name }
    if fields_list.include? (name)

      self[name] = arg[0]
    else
      #super
    end
  end

  def copy_profile
    self.customer_profile = enquiry.customer.clone_profile
    self.customer_profile.address = enquiry.customer.address
    self.save!
  end

  def state
    enquiry.state
  end

  def region
    enquiry.region
  end

  def place
    enquiry.place
  end

  private

  #set validation for dynamic field
  def set_dynamic_validation
    unless product.nil?
      product.reply_fields.each do |field|
        validates_presence_of field.machine_name.to_sym if field.validation.include? "required"
      end
    end
  end

  #initialize dynamic field
  def initialize_dynamic_attributes
    unless product.nil?
      product.reply_fields.each do |field|
        self[field.machine_name.to_sym] ||= nil
      end
    end
  end

end

