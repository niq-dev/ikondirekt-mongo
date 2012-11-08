module Partner
  class DashboardController < BaseController
    # GET /dashboards
    # GET /dashboards.json
    def index
      @page_title = t(:dashboard)

    end
  end
end