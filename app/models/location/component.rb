module Location
  module Component
    module Address
      extend ActiveSupport::Concern

      def self.included(base)
        base.class_eval do
          embeds_one :address, class_name: "Location::Address", autobuild: true, as: :addressable

          scope :in_state, lambda { |state_code| where("address.state_code" => state_code.to_i) }
          scope :in_region, lambda { |region_code| where("address.region_code" => region_code.to_i) }
          scope :in_place, lambda { |place_code| where("address.place_code" => place_code.to_i) }
          scope :in_places, lambda { |place_codes| any_in("address.place_code" => place_codes.map{|x| x.to_i}) }
          #scope :in_places, lambda do |place_codes|
          #  in("address.place_code": place_codes)
          #end
        end
      end

      def address_street
        self.address.street
      end

      def address_phone
        self.address.phone
      end

      def address_fax
        self.address.fax
      end

      def state
        self.address.state
      end

      def region
        self.address.region
      end

      def place
        self.address.place
      end

      def full_address
        resource = []
        if address.present?
          resource << address.street if address.street.present?
          resource << address.state.name if address.state.present?
          resource << address.place.name if address.place.present?
          resource.compact.join(', ')
        end
      end
    end
  end
end