  class Customer::BaseController < ApplicationController
    layout "customer_application"

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

    def after_sign__path_for(resource_or_scope)
      enquiries_path
    end
  end
