module Location
  class Address
    include Mongoid::Document
    after_validation :set_location

    field :street, type: String
    field :phone, type: String
    field :fax, type: String
    field :place_code, type: Integer
    field :region_code, type: Integer
    field :state_code, type: Integer

    belongs_to :state, :class_name => 'Location::State'
    belongs_to :region, :class_name => 'Location::Region'
    belongs_to :place, :class_name => 'Location::Place'

    validates :street, presence: true, length: {minimum: 2}
    validates :place_code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8},
              inclusion: {in: Location::Place.all.map(&:code)}

    def set_location
      if self.place_code.present?
        self.place = Location::Place.where(:code => self.place_code).first
      end

      if self.place.region.present?
        self.region = place.region
        self.region_code = region.code
      end

      if self.region.state.present?
        self.state = region.state
        self.state_code = state.code
      end
    end
  end
end