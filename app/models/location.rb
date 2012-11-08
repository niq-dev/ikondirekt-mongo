module Location
  class State
    include Mongoid::Document

    field :code, type: Integer
    field :name, type: String
    field :language, type: String

    has_many :regions, :class_name => 'Location::Region', :inverse_of => :state

    validates :code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8}
    validates :name, presence: true, length: {minimum: 2}
    validates :language, presence: true, length: {minimum: 2, maximum: 3}

  end

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

  class Place
    include Mongoid::Document

    field :code, type: Integer
    field :name, type: String
    field :region_code, type: Integer
    field :state_code, type: Integer

    belongs_to :state, :class_name => 'Location::State'
    belongs_to :region, :class_name => 'Location::Region', :inverse_of => :place, index: true

    #def set_state
    #  self.state = self.region.state self.state.nil?
    #end
    delegate :state, :to => :region

    validates :code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8}
    validates :name, presence: true, length: {minimum: 2}
    validates :region_code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8},
              inclusion: {in: Location::Region.all.map(&:code)}

  end

  class Address
    include Mongoid::Document
    include Base

    field :street, type: String
    field :phone, type: String
    field :fax, type: String
    field :place_code, type: Integer
    field :region_code, type: Integer
    field :state_code, type: Integer

    belongs_to :state, :class_name => 'Location::State'
    belongs_to :region, :class_name => 'Location::Region'
    belongs_to :place, :class_name => 'Location::Place'

    delegate :state,
             :region, :to => :place
    #def set_state
    #  self.state = self.place.state unless self.state.nil?
    #end

    #def set_region
    #  self.region = self.place.region unless self.region.nil?
    #end

    validates :street, presence: true
  end
end