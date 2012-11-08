class ApplicationWidget < Apotomo::Widget
  include Devise::Controllers::Helpers

  helper_method :current_user
  helper_method :user_signed_in?

end