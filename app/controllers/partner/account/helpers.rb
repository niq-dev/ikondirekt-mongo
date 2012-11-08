class Partner::Account::HelpersController < ApplicationController

  def after_sign_in_path_for(resource)
    partner_root_path
  end

  def after_sign_out_path_for(resource)
    partner_root_path
  end
end
