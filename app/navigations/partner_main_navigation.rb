# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav'
    #primary.item :dashboard, image_tag("themes/admin/icons/mainnav/ui.png") + '<span>'.html_safe + t(:dashboard) + '</span>'.html_safe, partner_root_path
    primary.item :enquiries, image_tag("themes/admin/icons/mainnav/messages.png") +  '<span>'.html_safe + t(:enquiries) + '</span>'.html_safe, partner_enquiries_path
    primary.item :staffs, image_tag("themes/admin/icons/mainnav/ui.png") +  '<span>'.html_safe + t(:staffs) + '</span>'.html_safe, partner_staffs_path
    primary.item :branches, image_tag("themes/admin/icons/mainnav/tables.png") +  '<span>'.html_safe + t(:branches) + '</span>'.html_safe, partner_branches_path
    primary.item :statistics, image_tag("themes/admin/icons/mainnav/statistics.png") +  '<span>'.html_safe + t(:statistics) + '</span>'.html_safe, partner_statistics_path
    primary.item :statistics, image_tag("themes/admin/icons/mainnav/statistics.png") +  '<span>'.html_safe + t(:invoice) + '</span>'.html_safe, partner_statistics_path

    #primary.item :invoice, image_tag("themes/admin/icons/mainnav/statistics.png") +  '<span>'.html_safe + "invoice" + '</span>'.html.safe, partner_root_path
  end
end
