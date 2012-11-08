module Partner
  class LocationFilterWidget < BaseWidget

    def display
      @states_list = Location::State.all.map { |state| [state.name, state.code] }
      @regions_list = []
      @places_list = []
      if params[:region_code].present?
        @places_list = Location::Place.where(:region_code => params[:region_code]).map { |place| [place.name, place.code] }
        @regions_list = Location::Region.where(:code => params[:region_code]).map { |region| [region.name, region.code] }
      elsif params[:state_code]
        @regions_list = Location::Region.where(:state_code => params[:state_code]).map { |region| [region.name, region.code] }
      end
      render
    end

  end

end