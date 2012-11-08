class Admin::Accounts::PasswordsController < Devise::PasswordsController

  def new
    @content_style = :sign
    @page_title = "Passwort vergessen?"
    super
  end

end
