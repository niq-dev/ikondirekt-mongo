module Partner
  class BaseWidget < ApplicationWidget
    helper_method :current_staff
    helper_method :current_customer
    helper_method :staff_signed_in?
  end
end