class Admin::Accounts::SessionsController < Devise::SessionsController

  def create
    super
  end

  def new
    @content_style = :sign
    @page_title = "Anmelden"
    @page_description = "Sign in to admin backend"
    super
  end

  def delete
     super
  end
end