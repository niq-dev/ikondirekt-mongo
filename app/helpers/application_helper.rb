module ApplicationHelper
  def namespace_url(space, obj)
    rs = "@#{obj}.new_record?? #{space}_#{obj.pluralize}_path : #{space}_#{obj}_path(@#{obj})"
    eval(rs)
  end

  def render_navbar
    controller_namespace = params[:controller].split('/').first
    case controller_namespace
      when "admin"
        render "shared/blocks/navbar/navbar_admin"
      when "partner"
        render "shared/blocks/navbar/navbar_partner"
      else
        render "shared/blocks/navbar/navbar"
    end
  end

  def body_id
    controller_namespace = params[:controller].split('/').first
    case controller_namespace
      when "admin"
        "backend"
      when "web_users"
        "backend"
      when "partner"
        "backend"
      when "partner_users"
        "backend"
      else
        "frontend"
    end
  end

  def render_content(content_style)
    case content_style
      when :sign
        render "shared/content/sign"
      when :blank
        render "shared/content/blank"
      else
        render "shared/content/box"
    end
  end

  def render_sidebar
    render "shared/blocks/sidebar/user_account"
  end

  def render_footer

  end

  def admin_content_form_for(object, *args, &block)
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(:builder => AdminContentFormBuilder)), &block)
  end


end

class AdminContentFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
      "<div class='formRow'>#{super}<div class='clear'></div></div>".html_safe
  end
end
