module Location
  module Base
    extend ActiveSupport::Concern

    #def self.included(base)
    #  base.after_validation :set_location
    #end

    #def set_location
      #set_place
      #set_region
      #set_state
      #set_place_code
      #set_region_code
      #set_state_code
    #end

    def set_place_code
      self.place_code = self.place.code if self.respond_to?(:place)
    end

    def set_place
      if self.respond_to?(:place) and self.place_code.present?
        self.place = Location::Place.where(:code => self.place_code).first
      end
    end

    def set_region_code
      self.region_code = self.region.code if self.respond_to?(:region)
    end

    def set_region
      if self.respond_to?(:region) and self.region_code.present?
        self.region = Location::Region.where(:code => self.place_code).region
      end
    end

    def set_state_code
      if self.respond_to?(:state) and self.state_code.nil?
        self.state_code = self.state.code
      end
    end

    def set_state
      if self.respond_to?(:state) and self.state_code.present?
        self.state = Location::State.where(:code => self.state_code).region
      end
    end
  end
end