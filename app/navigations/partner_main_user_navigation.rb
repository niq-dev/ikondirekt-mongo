# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'leftUser'
    primary.item :my_profile, t(:my_profile), edit_partner_account_profile_path(current_staff), :class => "sProfile"
    primary.item :change_password, t(:change_password), edit_partner_account_password_path(current_staff), :class => "sChangePassword"
    #primary.item :settings, t(:settings), '#', :class => "sSettings"
    primary.item :logout, t(:logout), '#', :class => "sLogout"
  end
end