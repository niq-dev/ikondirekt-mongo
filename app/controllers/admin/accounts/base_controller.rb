module Admin
  class BaseController < ApplicationController
    before_filter :authenticate_customer!
    layout "admin_application"
  end
end
