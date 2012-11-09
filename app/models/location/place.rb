module Location
  class Place
    include Mongoid::Document
    after_validation :set_location

    field :code, type: Integer
    field :name, type: String
    field :region_code, type: Integer
    field :state_code, type: Integer

    belongs_to :state, :class_name => 'Location::State'
    belongs_to :region, :class_name => 'Location::Region', :inverse_of => :place, index: true

    validates :code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8}
    validates :name, presence: true, length: {minimum: 2}
    validates :region_code, presence: true, numericality: {only_integer: true}, length: {minimum: 1, maximum: 8},
              inclusion: {in: Location::Region.all.map(&:code)}

    def set_location
      if self.region_code.present?
        self.region = Location::Region.where(:code => self.region_code).first
      end

      if self.region.state.present?
        self.state = region.state
        self.state_code = state.code
      end
    end

  end
end