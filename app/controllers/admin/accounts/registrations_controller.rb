class Admin::Accounts::RegistrationsController < Devise::RegistrationsController

  def new
    @content_style = :sign
    @page_title = "Registrieren"
    super
  end

end
