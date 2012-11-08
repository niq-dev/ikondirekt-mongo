module Partner
  class SecNavWidget < BaseWidget

    def display
      self << widget("partner/location_filter")
      render
    end

  end
end
