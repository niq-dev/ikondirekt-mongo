module Location
  class Region
    include Mongoid::Document
    after_validation :set_location

    field :code, type: Integer
    field :name, type: String
    field :state_code, type: Integer

    belongs_to :state, :class_name => 'Location::State'
    has_many :places, :class_name => 'Location::Place', :inverse_of => :region

    validates :code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8}
    validates :name, presence: true, length: {minimum: 2}
    validates :state_code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8},
              inclusion: {in: Location::State.all.map(&:code)}

    def set_location
      if self.state_code.present?
        self.state = Location::State.where(:code => self.state_code).first
      end
    end

  end
end