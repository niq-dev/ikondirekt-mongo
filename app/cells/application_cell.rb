class ApplicationCell < Cell::Rails
  include Devise::Controllers::Helpers

  helper_method :current_user
  helper_method :user_signed_in?

  helper_method :current_customer
  helper_method :customer_signed_in?

  helper_method :current_staff
  helper_method :staff_signed_in?

end

