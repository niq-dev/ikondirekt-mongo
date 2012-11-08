class Partner::Account::SessionsController < Devise::SessionsController
  layout "admin_sign_application"

  has_widgets do |root|
    root << widget("partner/js_library")
    root << widget("partner/top_line")
  end

  def create
    super
  end

  def new
    @content_style = :sign
    @page_title = "Anmelden"
    @page_description = "Sign in to Parnter Backend"
    super
  end

  def delete
     super
  end

  def after_sign_in_path_for(resource_or_scope)
    partner_root_path(resource)
  end
end