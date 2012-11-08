module Partner
  class BaseController < ApplicationController
    before_filter :authenticate_staff!

    layout "admin_application"

    add_crumb I18n.t(:dashboard), :partner_root_path

    has_widgets do |root|
      root << widget("partner/js_library")
      root << widget("partner/top_line")
      root << widget("partner/main_nav")
      root << widget("partner/sec_nav")
    end

  end
end
